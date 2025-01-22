/*
 * Usuario.c
 *
 *  Created on: Jan 21, 2025
 *      Author: tomeu
 */

#include "Usuario.h"
#include <string.h>

// Función para buscar un usuario por ID
Usuario* usuario_SRCH(Usuario usuarios[], uint8_t num_usuarios, const char* id) {
    for (uint8_t i = 0; i < num_usuarios; i++) {
        if (strncmp(usuarios[i].ID, id, sizeof(usuarios[i].ID)) == 0) {
            return &usuarios[i];  // Retorna un puntero al usuario encontrado
        }
    }
    return NULL;  // Si no se encuentra el usuario
}

_Bool usuario_PSSWRD(Usuario user, const char* PASSWORD){
	if (strncmp(user.PASSWORD, PASSWORD, sizeof(user.PASSWORD)) == 0) {
	            return 1;  // Retorna un puntero al usuario encontrado
	        }
	return 0;
}

void usuario_GET_KEYS(const Usuario *user, char *output, uint8_t output_size) {
    output[0] = '\0';  // Inicializar la cadena resultante

    for (int i = 0; i < MAX_KEYS; i++) {
        if (user->keys[i].letter == '\0' && user->keys[i].number == 0) {
            break;  // Detener si encontramos un espacio vacío en el array de llaves
        }

        char temp[8];  // Espacio suficiente para cada "LNUM "
        snprintf(temp, sizeof(temp), "%c%c ", user->keys[i].letter, user->keys[i].number);

        if (strlen(output) + strlen(temp) < output_size - 2) {
            strcat(output, temp);
            strcat(output, " ");
        } else {
            break;  // Evitar desbordamiento de buffer
        }
    }

    // Eliminar el espacio extra final si la cadena no está vacía
    uint8_t len = strlen(output);
    if (len > 0 && output[len - 1] == ' ') {
        output[len - 1] = '\0';
    }
}

void usuario_CNF(Usuario *usuario, const char *id, const char *password, Key keys[], uint8_t num_keys) {
    strncpy(usuario->ID, id, MAX_ID );

    strncpy(usuario->PASSWORD, password, MAX_PASSWORD );

    memcpy(usuario->keys, keys, num_keys * sizeof(Key));
}

// Funcin para configurar un vector de llaves
void keys_CNF(Key keys[], uint8_t num_keys, const char letters[], const char numbers[]) {
    for (uint8_t i = 0; i < num_keys; i++) {
        keys[i].letter = letters[i];
        keys[i].number = numbers[i];
    }
}
