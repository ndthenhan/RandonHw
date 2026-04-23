
#include "ConsoleInterface.h"
#include "main.h"
#include "printUART.h"
#include <stdio.h>

void CommandUART(void) {
  setbuf(stdout, NULL); // turn off file buffering for stdout, to ensure that
                        // the data is sent over serial immediately
  printfUARTport(&huart2, "\033[2J");
  printfUARTport(&huart2, "\r\n===TwencoBoot-STM32===\r\n");
  printfUARTport(&huart2,
                 "\r\nPress C within 3 seconds for device functions...\r\n");
  uint8_t chr[1];
  uint8_t inmenu = 0;
  uint32_t timeout = 3000;

  while (HAL_UART_Receive(&huart2, (uint8_t *)chr, 1, timeout) == HAL_OK) {
    switch (chr[0]) {
    case 'C':
      inmenu = 1; // lockout other functions unless we're already in this menu
      timeout = 60000; // timeout 60s
      printfUARTport(&huart2, "\033[2J");
      printfUARTport(&huart2, "\r\n===Device Control===\r\n");
      printfUARTport(&huart2, "\r\nKEY:\tFUNCTION:\r\n");
      printfUARTport(&huart2, "C\tShow this menu\r\n");
      printfUARTport(&huart2, "D\tDelete file fw\r\n");
      printfUARTport(&huart2, "F\tFormat SPI Flash\r\n");
      printfUARTport(&huart2, "L\tList files in flash\r\n");
      printfUARTport(&huart2, "N\tWrite Network settings\r\n");
      printfUARTport(&huart2, "R\tReboot Device\r\n");
      printfUARTport(&huart2, "S\tForce SHA256 write to fw.sha256\r\n");
      printfUARTport(&huart2, "U\tForce update from file fw\r\n");

      break;
    case 'F':
      if (inmenu) {
        printfUARTport(&huart2, "F\tFormat SPI Flash\r\n");
      }
      break;
    case 'R':
      HAL_NVIC_SystemReset();
      break;
    case 'U':
      printfUARTport(&huart2, "U\tForce update from file fw\r\n");
      // force update device
      break;
    case 'N':
      HAL_NVIC_SystemReset();
      break;
    case 'L':
      printfUARTport(&huart2, "L\tList files in flash\r\n");
      break;
    case 'D':
      HAL_NVIC_SystemReset();
      break;
    default:
      break;
    }
  }
}
