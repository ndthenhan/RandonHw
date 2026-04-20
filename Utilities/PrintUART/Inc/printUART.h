#ifndef PRINTUART_H
#define PRINTUART_H

#include <stdio.h>
#include "usart.h"
void printfUARTport(UART_HandleTypeDef *huart, const char *fmt, ...);
void UART2_Printf(const char *fmt, ...);
void UART3_Printf(const char *fmt, ...);

#endif // PRINTUART_H
