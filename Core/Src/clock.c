/*
 * clock.c
 *
 *  Created on: May 5, 2025
 *      Author: simranmann
 */

//Contains basic functions used to help display the current clock state in the UI display source file.



#include "clock.h"
#include "ClockUI.h"

void Clock_update_current_time(Clock * const clk) {
    if(++clk->time_now == MAX_TIME){
        clk->time_now = 0;
        //send update date event to UI objevt
    }
}

bool Clock_alarm_on_or_off(Clock* const clk) {
    return (clk->time_now == clk->alarm_time);
}

uint32_t Clock_get_current_time(Clock * const clk) {
    return clk->time_now; //fix this
}

uint8_t Clock_get_time_mode(Clock * const clk) {
    return clk->time_mode;
}

void Clock_set_current_time(Clock * const clk, uint32_t new_time) {
    clk->time_now = new_time;//fix_this
}

void Clock_set_alarm_time(Clock* const clk, uint32_t new_time) {
    clk->alarm_time = new_time;
}

void Clock_set_date(Clock* const clk, date_t *const  new_date) {
    clk->date_now.day = new_date->day;
    clk->date_now.date = new_date->date;
    clk->date_now.month = new_date->month;
    clk->date_now.year = new_date->year;
}

void Clock_get_date(Clock* const clk, date_t *const pdate) {
    pdate->day = clk->date_now.day;
    pdate->date = clk->date_now.date;
    pdate->month = clk->date_now.month;
    pdate->year = clk->date_now.year;
}
//if the time format is 24H clock then this function is used to determine if it is am or pm
uint8_t Clock_get_am_or_pm(uint32_t time24h)
{
    uint8_t ampm;
    uint8_t h = (uint8_t)GET_HOUR(time24h);
    if (h == 0U)
        ampm = FORMAT_AM;
    else if (h >= 12U)
        ampm = FORMAT_PM;
    else
        ampm = FORMAT_AM;
    return ampm;
}

void Clock_init(Clock *const clk) {
    clk->time_now = INITIAL_CURR_TIME;
    clk->time_mode = MODE_24H;
    clk->alarm_time = INITIAL_ALARM_TIME;
    clk->date_now.day = INITIAL_DAY;
    clk->date_now.date = INITIAL_DATE;
    clk->date_now.month = INITIAL_MONTH;
    clk->date_now.year = INITIAL_YEAR;
//    clk->alarm_status = INITIAL_ALARM_STATUS;//add for alarm on or off
}


