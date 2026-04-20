#include "printUART.h"
//#include "usart.h"
#include <stdarg.h>
#include <stdio.h>

/* void UART2_Printf(const char *fmt, ...) {
    char buffer[256]; // Ensure buffer is large enough for your longest message
    va_list args;
    va_start(args, fmt);
    int len = vsnprintf(buffer, sizeof(buffer), fmt, args);
    va_end(args);

    if (len > 0) {
        HAL_UART_Transmit(&huart2, (uint8_t *)buffer, len, 100);
    }
} */

void printfUARTport(UART_HandleTypeDef *huart, const char *fmt, ...) {
    char buffer[256];
    va_list args;
    va_start(args, fmt);
    int len = vsnprintf(buffer, sizeof(buffer), fmt, args);
    va_end(args);

    if (len > 0) {
        HAL_UART_Transmit(huart, (uint8_t *)buffer, len, 100);
    }
}
