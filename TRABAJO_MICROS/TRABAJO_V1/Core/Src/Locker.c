/*
 * Locker.c
 *
 *  Created on: Jan 15, 2025
 *      Author: tomeu
 */
#include <stdint.h>
#include <stdio.h>
#include "Locker.h"
#include "Locker_cnf.h"
#include "gpio.h"

void Locker_Init(void)
{
	GPIO_InitTypeDef	gpio;
	if (sizeof(LOCKER_GPIO_PIN) != sizeof(LOCKER_GPIO_PORT)/4 )
	    printf("Error detected!");

	  for(uint8_t	i=0 ; i<sizeof(LOCKER_GPIO_PIN)/2 ; i++)
	  {
	    gpio.Mode = GPIO_MODE_OUTPUT_PP;
	    gpio.Pull = GPIO_NOPULL;
	    gpio.Speed = GPIO_SPEED_FREQ_LOW;
	    gpio.Pin = LOCKER_GPIO_PIN[i];
	    HAL_GPIO_Init((GPIO_TypeDef*)LOCKER_GPIO_PORT[i], &gpio);
	    HAL_GPIO_WritePin((GPIO_TypeDef*)LOCKER_GPIO_PORT[i], LOCKER_GPIO_PIN[i], GPIO_PIN_RESET);
	  }
}

void Locker_open(uint8_t lock)
{
		uint8_t NUM_OUTPUTS = sizeof(LOCKER_GPIO_PIN)/2;
	    if (lock >= (1 << NUM_OUTPUTS-1)) {
	    	printf("Error detected!, out of range");// Si el número excede el rango permitido, salimos sin cambiar nada.
	        return;
	    }

	    for (int i = 0; i < (NUM_OUTPUTS-1); i++) {
	        // Extraer el bit correspondiente
	        uint8_t bit = (lock >> i) & 0x01;

	        // Configurar el pin correspondiente
	        HAL_GPIO_WritePin(LOCKER_GPIO_PORT[i+1], LOCKER_GPIO_PIN[i+1], (bit == 1) ? GPIO_PIN_SET : GPIO_PIN_RESET);
	    }
	    HAL_GPIO_WritePin(LOCKER_GPIO_PORT[0], LOCKER_GPIO_PIN[0], GPIO_PIN_SET);
}

void Locker_close(){
	HAL_GPIO_WritePin(LOCKER_GPIO_PORT[0], LOCKER_GPIO_PIN[0], GPIO_PIN_RESET);
}

void Locker_open_key(char letter, char number){
	uint8_t code = (int) (letter-'A')*8 + (number - '1');
	Locker_open(code);
}
