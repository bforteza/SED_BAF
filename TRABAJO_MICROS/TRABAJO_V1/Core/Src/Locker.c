/*
 * Locker.c
 *
 *  Created on: Jan 15, 2025
 *      Author: tomeu
 */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "Locker.h"
#include "Locker_cnf.h"
#include "stdint.h"
#include "gpio.h"
#include "stm32f4xx_hal_conf.h"
#include "stm32f4xx_hal_tim.h"
#include "stm32f4xx_hal_gpio.h"
#include "tim.h"
void Timer_Init(void);

void Locker_Init(void)
{
    GPIO_InitTypeDef gpio;
    if (sizeof(LOCKER_GPIO_PIN) != sizeof(LOCKER_GPIO_PORT) / 4)
        printf("Error detected!");

    for (uint8_t i = 0; i < sizeof(LOCKER_GPIO_PIN) / 2; i++)
    {
        gpio.Mode = GPIO_MODE_OUTPUT_PP;
        gpio.Pull = GPIO_NOPULL;
        gpio.Speed = GPIO_SPEED_FREQ_LOW;
        gpio.Pin = LOCKER_GPIO_PIN[i];
        HAL_GPIO_Init((GPIO_TypeDef *)LOCKER_GPIO_PORT[i], &gpio);
        HAL_GPIO_WritePin((GPIO_TypeDef *)LOCKER_GPIO_PORT[i], LOCKER_GPIO_PIN[i], GPIO_PIN_RESET);
    }

}

uint8_t mapCodeToLock(const char* code) {
    uint8_t lock = 0;

    if (code == NULL || code[0] == '\0' || code[1] == '\0') {
        return 0; // Retorna 0 si el código no es válido
    }
    switch (code[0]) {
        case 'A':
            if (code[1] == '1') lock = 1;
            else lock = 0;
            break;
        case 'B':
            if (code[1] == '1') lock = 2;
            else lock = 0;
            break;
        case 'C':
            if (code[1] == '1') lock = 3;
            else lock = 0;
            break;
        case 'D':
            if (code[1] == '1') lock = 4;
            else lock = 0;
            break;
        default:
            lock = 0; // Código no reconocido
            break;
    }
    return lock;
}

void Locker_open(uint8_t lock, uint32_t duration_ms)
{
    uint8_t NUM_OUTPUTS = sizeof(LOCKER_GPIO_PIN) / 2;
    if (lock >= (1 << (NUM_OUTPUTS - 1))) {
        printf("Error detected!, out of range");
        return;
    }

    for (uint8_t i = 0; i < (NUM_OUTPUTS - 1); i++) {
        uint8_t bit = (lock >> i) & 0x01;
        HAL_GPIO_WritePin((GPIO_TypeDef *)LOCKER_GPIO_PORT[i + 1], LOCKER_GPIO_PIN[i + 1], (bit == 1) ? GPIO_PIN_SET : GPIO_PIN_RESET);
    }
    HAL_GPIO_WritePin((GPIO_TypeDef *)LOCKER_GPIO_PORT[0], LOCKER_GPIO_PIN[0], GPIO_PIN_SET);

    HAL_NVIC_SetPriority(TIM7_IRQn, 0, 0);
    //Enable the peripheral IRQ
    HAL_NVIC_EnableIRQ(TIM7_IRQn);
    __HAL_TIM_SET_AUTORELOAD(&htim7, duration_ms - 1);
   HAL_TIM_Base_Start_IT(&htim7);
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM7)
    {
    	Locker_close();
    }
}

 void Locker_close()
{
	HAL_GPIO_WritePin((GPIO_TypeDef *)LOCKER_GPIO_PORT[0], LOCKER_GPIO_PIN[0], GPIO_PIN_RESET);
	HAL_TIM_Base_Stop_IT(&htim7);
}
