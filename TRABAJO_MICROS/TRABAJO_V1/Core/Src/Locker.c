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
#include "gpio.h"
#include "stm32f4xx_hal_conf.h"
#include "stm32f4xx_hal_tim.h"
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

    // Inicializar el temporizador
    Timer_Init();
}

void Timer_Init(void)
{
    __HAL_RCC_TIM2_CLK_ENABLE(); // Habilitar el reloj par	a TIM2 (ajustar el TIM según tu configuración)

    htim2.Instance = TIM2;
    htim2.Init.Prescaler = 15999; // Prescaler para obtener 1 ms por cuenta
    htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
    htim2.Init.Period = 5000 - 1; // Valor inicial (5 segundos)
    htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    htim2.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;

    HAL_TIM_Base_Init(&htim2);
}

void Process_Input_String(const unsigned char *input_string, uint8_t duration_ms)
{
    uint8_t lock = 0; // Inicializar lock en 0

    // Recorrer la cadena carácter por carácter
    for (size_t i = 0; i < strlen((const char *)input_string); i++)
    {
        // Mapear los caracteres al bit correspondiente (0-7)
        if (i < 8) // Solo los primeros 8 caracteres afectan a lock
        {
            lock |= (1 << i); // Activar el bit correspondiente según la posición en la cadena
        }
    }

    // Llamar a Locker_open con el valor calculado y el tiempo especificado
    Locker_open(lock, duration_ms);
}

void Locker_open(uint8_t lock, uint8_t duration_ms)
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

    // Configurar el temporizador con la nueva duración
    htim2.Init.Period = duration_ms - 1; // Ajustar el periodo al tiempo especificado
    HAL_TIM_Base_Init(&htim2);          // Reiniciar la configuración del temporizador

    HAL_TIM_Base_Start_IT(&htim2); // Inicia el temporizador en modo de interrupción
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM2) // Verificar que es el temporizador correcto
    {
        // Llamar a Locker_close para cerrar la cerradura automáticamente después del tiempo configurado
        Locker_close();
    }
}

void Locker_close()
{
	HAL_GPIO_WritePin((GPIO_TypeDef *)LOCKER_GPIO_PORT[0], LOCKER_GPIO_PIN[0], GPIO_PIN_RESET);
}
