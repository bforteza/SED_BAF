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
void	KeyPad_Init(void)
{
  GPIO_InitTypeDef	gpio;
  KeyPad.ColumnSize = sizeof(_KEYPAD_COLUMN_GPIO_PIN) / 2;
  KeyPad.RowSize = sizeof(_KEYPAD_ROW_GPIO_PIN) / 2;

  // Configurar las columnas como salidas
  for(uint8_t	i=0 ; i<KeyPad.ColumnSize ; i++)
  {
    gpio.Mode = GPIO_MODE_OUTPUT_PP;
    gpio.Pull = GPIO_NOPULL;
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    gpio.Pin = _KEYPAD_COLUMN_GPIO_PIN[i];
    HAL_GPIO_Init((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i], &gpio);
    HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i], _KEYPAD_COLUMN_GPIO_PIN[i], GPIO_PIN_SET);
  }

  // Configurar las filas como entradas con interrupciones (flanco ascendente)
  for(uint8_t	i=0 ; i<KeyPad.RowSize ; i++)
  {
    gpio.Mode = GPIO_MODE_IT_RISING; // Interrupción en flanco ascendente
    gpio.Pull = GPIO_PULLDOWN;       // Usar resistencias pull-down
    gpio.Speed = GPIO_SPEED_FREQ_LOW;
    gpio.Pin = _KEYPAD_ROW_GPIO_PIN[i];
    HAL_GPIO_Init((GPIO_TypeDef*)_KEYPAD_ROW_GPIO_PORT[i], &gpio);
  }

  // Habilitar interrupciones EXTI para las filas
  for (uint8_t i = 0; i < KeyPad.RowSize; i++) {
    uint16_t pin = _KEYPAD_ROW_GPIO_PIN[i];
    switch (pin) {
      case GPIO_PIN_0: HAL_NVIC_EnableIRQ(EXTI0_IRQn); break;
      case GPIO_PIN_1: HAL_NVIC_EnableIRQ(EXTI1_IRQn); break;
      case GPIO_PIN_2: HAL_NVIC_EnableIRQ(EXTI2_IRQn); break;
      case GPIO_PIN_3: HAL_NVIC_EnableIRQ(EXTI3_IRQn); break;
      default: break;
    }
  }
}

//#############################################################################################
uint16_t	KeyPad_Scan(void)
{
  uint16_t  key=0;
  for(uint8_t c=0 ; c<KeyPad.ColumnSize ; c++)
  {
    // Configurar todas las columnas en alto
    for(uint8_t i=0 ; i<KeyPad.ColumnSize ; i++)
      HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[i], _KEYPAD_COLUMN_GPIO_PIN[i], GPIO_PIN_SET);

    // Configurar la columna actual en bajo
    HAL_GPIO_WritePin((GPIO_TypeDef*)_KEYPAD_COLUMN_GPIO_PORT[c], _KEYPAD_COLUMN_GPIO_PIN[c], GPIO_PIN_RESET);
    _KEYPAD_DELAY(5);

    for(uint8_t r=0 ; r<KeyPad.RowSize ; r++)
    {
      if(HAL_GPIO_ReadPin((GPIO_TypeDef*)_KEYPAD_ROW_GPIO_PORT[r], _KEYPAD_ROW_GPIO_PIN[r]) == GPIO_PIN_SET)
      {
        _KEYPAD_DELAY(_KEYPAD_DEBOUNCE_TIME_MS);
        if(HAL_GPIO_ReadPin((GPIO_TypeDef*)_KEYPAD_ROW_GPIO_PORT[r], _KEYPAD_ROW_GPIO_PIN[r]) == GPIO_PIN_SET)
        {
          key |= 1<<c;                    
          key |= 1<<(r+8);
          while(HAL_GPIO_ReadPin((GPIO_TypeDef*)_KEYPAD_ROW_GPIO_PORT[r], _KEYPAD_ROW_GPIO_PIN[r]) == GPIO_PIN_SET)
            _KEYPAD_DELAY(5);
          detected_key = key;
          detected_char = KeyPad_GetCharFromKey(key);
          return key;
        }
      }        
    }    
  }
  return key;
}

//#############################################################################################
char KeyPad_GetCharFromKey(uint16_t key)
{
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
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  // Verificar si la interrupción proviene de uno de los pines de las filas
  for (uint8_t r = 0; r < KeyPad.RowSize; r++) {
    if (GPIO_Pin == _KEYPAD_ROW_GPIO_PIN[r]) {
      KeyPad_Scan();
      break;
    }
  }
}

//#############################################################################################
char KeyPad_GetDetectedChar(void)
{
  char key = detected_char;
  detected_char = 0; // Limpiar después de la lectura
  return key;
}

