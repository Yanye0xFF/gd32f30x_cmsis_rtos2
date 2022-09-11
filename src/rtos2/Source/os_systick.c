/**************************************************************************//**
 * @file     os_systick.c
 * @brief    CMSIS OS Tick SysTick implementation
 * @version  V1.0.2
 * @date     6. March 2020
 ******************************************************************************/
/*
 * Copyright (c) 2017-2020 ARM Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "os_tick.h"
#include "stdint.h"
#include "system_gd32f30x.h"
#include "gd32f30x_misc.h"
#include "core_cm4.h"

#ifdef  SysTick

// @see CortexM4_TRM_r0p1.pdf
// cortex-m0, m0plus, m3, m4
#define _SCB_BASE       (0xE000E010UL)
#define _SYSTICK_CTRL   (*(volatile uint32_t *)(_SCB_BASE + 0x0))
#define _SYSTICK_LOAD   (*(volatile uint32_t *)(_SCB_BASE + 0x4))
#define _SYSTICK_VAL    (*(volatile uint32_t *)(_SCB_BASE + 0x8))
#define _SYSTICK_CALIB  (*(volatile uint32_t *)(_SCB_BASE + 0xC))

#ifndef SYSTICK_IRQ_PRIORITY
// 0 bits for pre-emption priority 4 bits for subpriority
// 0: highest, 15: lowest
#define SYSTICK_IRQ_PRIORITY      15
#endif

static uint8_t PendST;

// Setup OS Tick.
int32_t OS_Tick_Setup (uint32_t freq, IRQHandler_t handler) {
  uint32_t load;
  (void)handler;

  if (freq == 0U) {
    //lint -e{904} "Return statement before end of function"
    return (-1);
  }

  load = (SystemCoreClock / freq) - 1U;
  if (load > 0x00FFFFFFU) {
    //lint -e{904} "Return statement before end of function"
    return (-1);
  }

  // Set SysTick Interrupt Priority
  // not use pre-emption priority, IRQ similar with common ARM Cortex-A processor...
  nvic_priority_group_set(NVIC_PRIGROUP_PRE0_SUB4);
  NVIC_SetPriority(SysTick_IRQn, SYSTICK_IRQ_PRIORITY);


  _SYSTICK_LOAD = load;
  _SYSTICK_VAL  = 0;
  // 0B111  CLKSOURCE:AHB, TICKINT:1, ENABLE:0
  _SYSTICK_CTRL = 0x06;

  PendST = 0U;

  return (0);
}

/// Enable OS Tick.
void OS_Tick_Enable (void) {

  if (PendST != 0U) {
    PendST = 0U;
    SCB->ICSR = SCB_ICSR_PENDSTSET_Msk;
  }
  _SYSTICK_CTRL = 0x07;
}

/// Disable OS Tick.
void OS_Tick_Disable (void) {

     _SYSTICK_CTRL = 0x06;

    if ((SCB->ICSR & SCB_ICSR_PENDSTSET_Msk) != 0U) {
        SCB->ICSR = SCB_ICSR_PENDSTCLR_Msk;
        PendST = 1U;
    }
}

// Acknowledge OS Tick IRQ.
// 函数返回值请忽略
unsigned OS_Tick_AcknowledgeIRQ (void) {
    // 读CTRL寄存器自动清零bit16
    unsigned ctrl = _SYSTICK_CTRL;
    return ctrl;
}

// Get OS Tick IRQ number.
int32_t  OS_Tick_GetIRQn (void) {
    return ((int32_t)SysTick_IRQn);
}

// Get OS Tick clock.
uint32_t OS_Tick_GetClock (void) {
    return (SystemCoreClock);
}

// Get OS Tick interval.
uint32_t OS_Tick_GetInterval (void) {
     uint32_t load = _SYSTICK_LOAD;
     return (load + 1U);
}

// Get OS Tick count value.
uint32_t OS_Tick_GetCount (void) {
    uint32_t load = _SYSTICK_LOAD;
    uint32_t val = _SYSTICK_VAL;
    return  (load - val);
}

// Get OS Tick overflow status.
uint32_t OS_Tick_GetOverflow (void) {
    unsigned ctrl = _SYSTICK_CTRL;
    return ((ctrl >> 16) & 1U);
}

#endif  // SysTick
