/*
 * Locker.h
 *
 *  Created on: Jan 15, 2025
 *      Author: tomeu
 */
#ifndef INC_LOCKER_H_
#define INC_LOCKER_H_
void Locker_Init(void);
void Locker_open(uint8_t lock, uint32_t duration_ms);
void Locker_close();
void Locker_ManualControl(uint8_t locker_index, uint8_t state);
#endif /* INC_LOCKER_H_ */
