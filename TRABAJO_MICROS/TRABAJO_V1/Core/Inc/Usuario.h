/*
 * Usuario.h
 *
 *  Created on: Jan 21, 2025
 *      Author: tomeu
 */

#include <stdint.h>
#define MAX_KEYS 32
#define MAX_ID 4
#define MAX_PASSWORD 4

#ifndef INC_USUARIO_H_
#define INC_USUARIO_H_

typedef struct {
    char letter;
    char number;
} Key;

// Definición de la estructura Usuario
typedef struct {
    char ID[MAX_ID+1];
    char PASSWORD[MAX_PASSWORD+1];
    Key keys[MAX_KEYS];
} Usuario;

Usuario* usuario_SRCH(Usuario usuarios[], uint8_t num_usuarios, const char* id);
_Bool usuario_PSSWRD(Usuario user, const char* PASSWORD);
void usuario_GET_KEYS(const Usuario *user, char *output, uint8_t output_size);

void usuario_CNF(Usuario *usuario, const char *id, const char *password, Key keys[], uint8_t num_keys);
void keys_CNF(Key keys[], uint8_t num_keys, const char letters[], const char numbers[]);

#endif /* INC_USUARIO_H_ */
