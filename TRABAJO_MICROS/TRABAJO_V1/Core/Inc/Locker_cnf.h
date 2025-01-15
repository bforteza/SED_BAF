/*
 * Locker_cnf.h
 *
 *  Created on: Jan 15, 2025
 *      Author: tomeu
 */
#include "gpio.h"
#ifndef INC_LOCKER_CNF_H_
#define INC_LOCKER_CNF_H_

const GPIO_TypeDef* LOCKER_GPIO_PORT[] =
{
  GPIOA, //ON-OFF
  GPIOA, //S0-S5
  GPIOA,
  GPIOA,
  GPIOC,
  GPIOB

};

const uint16_t LOCKER_GPIO_PIN[] =
{
  GPIO_PIN_0, //ON-OFF
  GPIO_PIN_2,
  GPIO_PIN_4,
  GPIO_PIN_6,
  GPIO_PIN_4,
  GPIO_PIN_0
};

#endif /* INC_LOCKER_CNF_H_ */
