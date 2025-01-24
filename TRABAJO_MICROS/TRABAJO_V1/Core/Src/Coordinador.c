/*
 * Coordinador.c
 *
 *  Created on: Jan 21, 2025
 *      Author: tomeu
 */
#include <stdio.h>
#include "Coordinador.h"
#include "Pantalla.h"
#include <string.h>
#include "Usuario.h"
#include "I2C_LCD.h"
#include "Locker.h"
void Coordinador_INIT(Coordinador* C, uint8_t LCD_inst){
	Pantalla_Conf(&C->pantalla[0],LCD_inst, "Enter ID","", 1, 0,1);
	Pantalla_Conf(&C->pantalla[1],LCD_inst, "Enter Password","", 1, 0,1);
	Pantalla_Conf(&C->pantalla[2],LCD_inst, "Enter Key", "", 0,0,0);
	Pantalla_Conf(&C->pantalla[3],LCD_inst, "Invalid","ID, Password or Key", 0, 1,0);
	Pantalla_Conf(&C->pantalla[4],LCD_inst, "Open","# to return", 0, 1,0);
	Pantalla_Conf(&C->pantalla[5],LCD_inst, "Set time value","", 0, 1,0);

	 Key keys1[8], keys2[8];

	    // Definir valores para el primer usuario
	    char letters1[] = {'B', 'B', 'B', 'B','B', 'B', 'B', 'B'};
	    uint8_t numbers1[] = {'1', '2', '3', '4','5','6','7','8'};
	    uint8_t num_keys1 = sizeof(letters1) / sizeof(letters1[0]);

	    // Definir valores para el segundo usuario
	    char letters2[] = {'C', 'C', 'C','C','C', 'C', 'C','C'};
	    uint8_t numbers2[] = {'1', '2', '3', '4','5','6','7','8'};
	    uint8_t num_keys2 = sizeof(letters2) / sizeof(letters2[0]);

	    // Configurar las llaves para ambos usuarios
	    keys_CNF(keys1, num_keys1, letters1, numbers1);
	    keys_CNF(keys2, num_keys2, letters2, numbers2);

	    // Configurar los usuarios
	    usuario_CNF(&C->usuario[0], "1234", "1234", keys1, num_keys1);
	    usuario_CNF(&C->usuario[1], "ABC2", "5678", keys2, num_keys2);

	    C->estado = user;
}


void Coordinador_ACTLZR(Coordinador* C){
	if(memcmp(&C->pantalla_actual, &C->pantalla[C->estado], sizeof(Pantalla)) ){
		I2C_LCD_Clear(C->pantalla[C->estado].LCD_instance);
		Pantalla_PRNT(C->pantalla[C->estado]);

	}
	memcpy(&C->pantalla_actual, &C->pantalla[C->estado], sizeof(Pantalla));

	switch (C->estado){
	case tmpconf:

		sprintf(C->pantalla[tmpconf].Inf, "%u MS", C->t_open);
		break;
	}
}

void Coordinador_IN(Coordinador* C, char ent){
	 char temp[2] = {ent, '\0'};
	if (ent != 0){
	switch (C->estado){
		case user:
			if(ent == '#'){
				C->usuario_actual = usuario_SRCH(C->usuario, NUM_MAX_USUARIOS ,C->pantalla[C->estado].Inf);
				memset(C->pantalla[C->estado].Inf, 0, sizeof(C->pantalla[C->estado].Inf));
				C->pantalla[C->estado].C_Cursor = 0;
				if (C->usuario_actual != NULL){
					C->estado = adress;
				}else{
					C->estado = error;
				}
			}
			if (ent == '*'){
				C->estado = tmpconf;
			}
			if (ent != '#' && ent != '*'){
				strcat(C->pantalla[C->estado].Inf, &temp);
				C->pantalla[C->estado].C_Cursor++;
			}
			break;
		case adress:
			if(ent == '#'){
				C->pantalla[C->estado].C_Cursor = 0;
				if (usuario_PSSWRD(*C->usuario_actual, C->entrada)){
					C->estado = keys;
					usuario_GET_KEYS(C->usuario_actual, C->pantalla[keys].Inf, sizeof(C->pantalla[keys].Inf));
				}else{
					C->estado = error;
				}
				memset(C->pantalla[adress].Inf, 0, sizeof(C->pantalla[adress].Inf));
				memset(C->entrada, 0, sizeof(C->entrada));
			}else{
				strcat(C->entrada, &temp);
				temp[0]= '*';
				strcat(C->pantalla[C->estado].Inf, &temp);
				C->pantalla[C->estado].C_Cursor++;
			}
			break;
		case keys:
			if(ent == '#'){
				C->estado = user;
			}else{
				strcat(C->entrada, &temp);
				if(strlen(C->entrada)>1){
					if(usuario_KEY(C->usuario_actual, C->entrada[0], C->entrada[1])){
						C->estado = open;
						Locker_open_key(C->entrada[0],C->entrada[1]);
					}
					if(C->estado != open)
					C->estado = error;
					memset(C->entrada, 0, sizeof(C->entrada));
				}
			}

			break;
		case error:
			if (ent == '#'){
				C->estado = user;
			}
			break;
		case open:
			if (ent == '#'){
				Locker_close();
				C->estado = keys;
			}
			break;
		case tmpconf:
			if (ent == '#'){
				C->estado = user;
			}
			break;
		default:
			break;
	}
	}
}

void Coordinador_IN_TIME(Coordinador* C, uint16_t t){
	C->t_open = t;
}
