/*
 * Locker.h
 *
 *  Created on: Jan 15, 2025
 *      Author: tomeu
 */

#ifndef INC_LOCKER_H_
#define INC_LOCKER_H_

void Locker_Init(void);
void Locker_open(uint8_t lock);
void Locker_close();
void Locker_open_key(char letter, char number);
#endif /* INC_LOCKER_H_ */
