#include "KeyPad.h"
#include "KeyPadConfig.h"
#include "gpio.h"
#if (_KEYPAD_USE_FREERTOS==1)
#include "cmsis_os.h"
#define _KEYPAD_DELAY(x)      osDelay(x)
#else
#define _KEYPAD_DELAY(x)      HAL_Delay(x)
#endif

KeyPad_t	KeyPad;
volatile uint16_t detected_key = 0;
volatile char detected_char = 0;

//#############################################################################################




//#############################################################################################
uint16_t	KeyPad_Scan(void)
{
	KeyPad.ColumnSize = 4;
	KeyPad.RowSize = 4;
  uint16_t  key=0;
  for(uint8_t c=0 ; c<KeyPad.ColumnSize ; c++)
  {
    // Configurar todas las columnas en alto
    for(uint8_t i=0 ; i<KeyPad.ColumnSize ; i++)
      HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i], _KEYPAD_COLUMN_GPIO_PIN[i], GPIO_PIN_RESET);

    // Configurar la columna actual en bajo
    HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[c], _KEYPAD_COLUMN_GPIO_PIN[c], GPIO_PIN_SET);
    //_KEYPAD_DELAY(5);

    for(uint8_t r=0 ; r<KeyPad.RowSize ; r++)
    {
      if(HAL_GPIO_ReadPin((GPIO_TypeDef*)_KEYPAD_ROW_GPIO_PORT[r], _KEYPAD_ROW_GPIO_PIN[r]) == GPIO_PIN_SET)
      {

    	  key |= 1<<c;
          key |= 1<<(r+8);
          return key;

      }
    }
  }
  return key;
}
/*
uint16_t KeyPad_Scan(void) {
    // Configurar todas las salidas (columnas) en bajo
    for (uint8_t i = 0; i < KeyPad.ColumnSize; i++) {
        HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i],
                          _KEYPAD_COLUMN_GPIO_PIN[i], GPIO_PIN_RESET);
    }

    uint16_t key = 0; // Variable para guardar el código del teclado

    // Iterar sobre cada columna (salida)
    for (uint8_t c = 0; c < KeyPad.ColumnSize; c++) {
        // Poner la columna actual en alto
        HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[c],
                          _KEYPAD_COLUMN_GPIO_PIN[c], GPIO_PIN_SET);

        // Verificar cada fila (entrada)
        for (uint8_t r = 0; r < KeyPad.RowSize; r++) {
            // Leer el estado de la fila
            if (HAL_GPIO_ReadPin((GPIO_TypeDef*)_KEYPAD_ROW_GPIO_PORT[r],
                                 _KEYPAD_ROW_GPIO_PIN[r]) == GPIO_PIN_SET) {
                // Construir el código en hexadecimal (columna y fila)
                key = 10000100 ;

                // Obtener el carácter correspondiente
                char detected_char = KeyPad_GetCharFromKey(key);

                // Registrar el carácter detectado
                detected_char = detected_char;

                // Salir de los bucles (tecla encontrada)
                goto end;
            }
        }

        // Restaurar la columna actual a bajo
        HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[c], _KEYPAD_COLUMN_GPIO_PIN[c], GPIO_PIN_RESET);
    }

end:
    // Restaurar todas las columnas a alto
    for (uint8_t i = 0; i < KeyPad.ColumnSize; i++) {
        HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i], _KEYPAD_COLUMN_GPIO_PIN[i], GPIO_PIN_SET);
    }

    return key;
}*/




//#############################################################################################
char KeyPad_GetCharFromKey(uint16_t key)
{
	 for (uint8_t i = 0; i < KeyPad.ColumnSize; i++) {
	    	          HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i],
	    	                            _KEYPAD_COLUMN_GPIO_PIN[i], GPIO_PIN_SET);
	    	      }
  switch(key)
  {
    case 0x0101: return '1';
    case 0x0201: return '4';
    case 0x0401: return '7';
    case 0x0801: return '*';
    case 0x0102: return '2';
    case 0x0202: return '5';
    case 0x0402: return '8';
    case 0x0802: return '0';
    case 0x0104: return '3';
    case 0x0204: return '6';
    case 0x0404: return '9';
    case 0x0804: return '#';
    case 0x0108: return 'A';
    case 0x0208: return 'B';
    case 0x0408: return 'C';
    case 0x0808: return 'D';
    default: return 0;
  }

}

//#############################################################################################


//#############################################################################################






