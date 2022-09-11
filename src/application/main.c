/*
 * main.c
 * @brief
 * Created on: Sep 10, 2022
 * Author: Yanye
 */

#include <string.h>
#include <stdbool.h>
#include "system_gd32f30x.h"
#include "cmsis_os2.h"
#include "rtt.h"

void app_main (void *argument) {
    const char * const ptr = "hello cmsis rtos2\n";
    unsigned len = strlen(ptr);
    (void)argument;

    while(true) {
        osDelay(1000);
        rtt_write(0, ptr, len);
    }
}


void entry(void) {
    const char * const ptr = "hello entry\n";
    unsigned len = strlen(ptr);

    SystemCoreClockUpdate();

    rtt_init();
    rtt_write(0, ptr, len);

    osKernelInitialize();                 // Initialize CMSIS-RTOS
    osThreadNew(app_main, NULL, NULL);    // Create application main thread
    osKernelStart();                      // Start thread execution

    while(true);
}

