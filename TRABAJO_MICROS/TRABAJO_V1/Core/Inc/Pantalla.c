/*
 * Pantalla.c
 *
 *  Created on: Jan 21, 2025
 *      Author: tomeu
 */


#include "Pantalla.h"
#include <string.h>


void Pantalla_Conf(Pantalla *p, uint8_t LCD_inst, const char* Sup, const char* Inf, _Bool Cursor, uint8_t C_Cursor, uint8_t R_Cursor) {
    strncpy(p->Sup, Sup, sizeof(p->Sup) - 1);
    p->LCD_instance = LCD_inst;

    strncpy(p->Inf, Inf, sizeof(p->Inf) - 1);

    p->Cursor = Cursor;
    p->C_Cursor = C_Cursor;
    p->R_Cursor = R_Cursor;
}

void Pantalla_PRNT(Pantalla p){

	   I2C_LCD_SetCursor(p.LCD_instance, 0, 0);
	   I2C_LCD_WriteString(p.LCD_instance, p.Sup );
	   I2C_LCD_SetCursor(p.LCD_instance, 0, 1);
	   I2C_LCD_WriteString(p.LCD_instance, p.Inf);
	   I2C_LCD_SetCursor(p.LCD_instance, p.C_Cursor, p.R_Cursor);
	   if(p.Cursor) {
		   I2C_LCD_Cursor(p.LCD_instance);
		   I2C_LCD_Blink(p.LCD_instance);
	   }
	   else{ I2C_LCD_NoCursor(p.LCD_instance);
	   I2C_LCD_NoBlink(p.LCD_instance);
	   }
}
