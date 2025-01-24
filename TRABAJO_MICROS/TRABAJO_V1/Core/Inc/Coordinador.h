/*
 * Coordinador.h
 *
 *  Created on: Jan 21, 2025
 *      Author: tomeu
 */
#include "Pantalla.h"
#include "Usuario.h"
#define NUM_MAX_PANTALLAS 6
#define NUM_MAX_USUARIOS 2
#define MAX_ENTRADA 4
#ifndef INC_COORDINADOR_H_
#define INC_COORDINADOR_H_

enum Estados {
    user,
    adress,
    keys,
    error,
	open,
	tmpconf
};

typedef struct {
    Pantalla pantalla[NUM_MAX_PANTALLAS];  // Vector de pantallas
    Usuario usuario[NUM_MAX_USUARIOS];     // Vector de usuarios

    Usuario* usuario_actual;
    Pantalla pantalla_actual;
    uint8_t num_pantallas;
    uint8_t num_usuarios;
    uint16_t t_open;

    char entrada[MAX_ENTRADA+1];
    enum Estados estado;

} Coordinador;

void Coordinador_INIT(Coordinador* C, uint8_t LCD_inst);
void Coordinador_ACTLZR(Coordinador* C);
void Coordinador_IN(Coordinador* C, char ent);
void Coordinador_IN_TIME(Coordinador* C, uint16_t t);
#endif /* INC_COORDINADOR_H_ */
