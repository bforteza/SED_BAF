/*
 * Pantalla.h
 *
 *  Created on: Jan 21, 2025
 *      Author: tomeu
 */
#include <stdbool.h>
#include "I2C_LCD.h"

#ifndef INC_PANTALLA_H_
#define INC_PANTALLA_H_

typedef struct {
	uint8_t LCD_instance;
	char Sup[40];
	char Inf[40];

	uint8_t C_Cursor;
	uint8_t R_Cursor;
	_Bool Cursor;
} Pantalla;

void Pantalla_Conf(Pantalla *p, uint8_t LCD_inst, const char* Sup, const char* Inf, _Bool Cursor, uint8_t C_Cursor, uint8_t R_Cursor);
void Pantalla_PRNT(Pantalla p);

#endif /* INC_PANTALLA_H_ */
