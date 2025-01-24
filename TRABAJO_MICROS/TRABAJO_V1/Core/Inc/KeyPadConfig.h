#ifndef	_KEYPADCONFIG_H
#define	_KEYPADCONFIG_H
#include "gpio.h"

#define           _KEYPAD_DEBOUNCE_TIME_MS        20
#define           _KEYPAD_USE_FREERTOS            0

const GPIO_TypeDef* _KEYPAD_COLUMN_GPIO_PORT[] =
{
  GPIOE,
  GPIOB,
  GPIOB,
  GPIOB
};

const uint16_t _KEYPAD_COLUMN_GPIO_PIN[] =
{
  GPIO_PIN_15,
  GPIO_PIN_11,
  GPIO_PIN_13,
  GPIO_PIN_15
};

const GPIO_TypeDef* _KEYPAD_ROW_GPIO_PORT[] =
{
  GPIOE,
  GPIOE,
  GPIOE,
  GPIOE
};

const uint16_t _KEYPAD_ROW_GPIO_PIN[] =
{
  GPIO_PIN_7,
  GPIO_PIN_9,
  GPIO_PIN_11,
  GPIO_PIN_13
};

#endif
