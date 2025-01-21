/*
 * Locker.h
 *
 *  Created on: Jan 15, 2025
 *      Author: tomeu
 */

#ifndef INC_LOCKER_H_
#define INC_LOCKER_H_
void Locker_Init(void);
void Locker_open(uint8_t lock, uint8_t duration_ms);
void Locker_close();
#endif /* INC_LOCKER_H_ */
