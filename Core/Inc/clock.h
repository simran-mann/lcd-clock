/*
 * clock.h
 *
 *  Created on: May 1, 2025
 *      Author: simranmann
 */


#ifndef CLOCK_H
#define CLOCK_H
#include<stdint.h>
#include<stdbool.h>

typedef struct {
    uint8_t day;
    uint8_t date;
    uint8_t month;
    uint16_t year;
}date_t;


//What the current clock time will start at; the times are stored in seconds
#define MONDAY 1
#define MAY  5
#define MAX_TIME  (864000UL)
#define INITIAL_CURR_TIME  ((22UL * 3600UL + 45UL * 60UL + 0UL))
#define INITIAL_ALARM_TIME  (8UL * 3600UL)
#define INITIAL_DAY MONDAY
#define INITIAL_MONTH  MAY
#define INITIAL_YEAR  2025ul
#define INITIAL_DATE  5
#define BASE_YEAR 2000

typedef enum time_mode {
    MODE_24H,
    MODE_12H
}time_mode_t;

typedef enum time_format_t{
    FORMAT_AM,
    FORMAT_PM
}time_format_t;

#ifdef __cplusplus
extern "C"{
#endif

typedef struct {
    uint32_t time_now;
    uint32_t alarm_time;//not imepltemted yet
    uint8_t time_format;
    uint8_t alarm_time_format;
//    uint8_t alarm_status; //not imepetmed yet
    uint8_t time_mode;
    date_t date_now;
} Clock;

void Clock_update_current_time(Clock * const clk);
bool Clock_alarm_on_or_off(Clock *const clk);//is_alarm
uint32_t Clock_get_current_time(Clock * const clk);
uint8_t Clock_get_time_mode(Clock * const clk);
void Clock_set_current_time(Clock * const clk, uint32_t new_time);
void Clock_set_alarm_time(Clock* const clk, uint32_t new_time);
void Clock_set_date(Clock * const clk, date_t *const  new_date);
void Clock_get_date(Clock * const clk, date_t *const pdate);
uint8_t Clock_get_am_or_pm(uint32_t time24h);
void Clock_init(Clock *const clk);
#ifdef __cplusplus
}
#endif



#endif
