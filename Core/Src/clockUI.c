/*
 * clockUI.c
 *
 *  Created on: May 5, 2025
 *      Author: simranmann
 */


#include "ClockUI.h"
#include<stdio.h>

const  char* g_days[] = { "Sunday", "Monday", "Tuesday", "Wednseday", "Thursday", "Firday", "Saturday" };
const char* g_months[] = { "January" , "February", "March","April","May", "June", "July", "August","September",\
                          "October","November","December" };

//static private helper functions
static uint32_t convert_24hformat_to_12h(uint32_t time24h);
static uint32_t convert_12hformat_to_24h(uint32_t time12h, time_format_t ampm);
static uint8_t  get_day_of_week(uint32_t year, uint32_t month, uint32_t day);
static bool was_settings_changed(const ClockUI* const me);
bool was_settings_time_changed(const ClockUI* const me);
bool was_settings_date_changed(const ClockUI* const me);
bool was_settings_alarm_changed(const ClockUI* const me);
static void integertime_to_string(uint32_t time_, char* const buf);


//converts time represented in int to time reoresented in str
static void integertime_to_string(uint32_t time_, char* const buf) {
    uint8_t h, m, s;
    h = (uint8_t)GET_HOUR(time_);
    m = (uint8_t)GET_MIN(time_);
    s = (uint8_t)GET_SEC(time_);
    sprintf(buf, "%02d:%02d:%02d", h, m, s);
}

//display the updated time on the LCD.
void ClockUI_update_current_time(ClockUI* const clk) {
    uint32_t time24h;
    uint32_t time_;
    char time_as_string[10];

    time24h = Clock_get_current_time(&clk->clock_inst);
    time_ = (Clock_get_time_mode(&clk->clock_inst) == MODE_24H) ? time24h : \
        convert_24hformat_to_12h(time24h);

    integertime_to_string(time_, time_as_string);
    Lvgl_display_clock(&clk->lvgl_inst, time_as_string);
}

//display the updated time on the LCD.
void ClockUI_update_current_date(ClockUI* const clk) {
    date_t new_date;
    Clock_get_date(&clk->clock_inst, &new_date);
    if (clk->state == STATE_SETTING) {
        Lvgl_display_calendar_date(&clk->lvgl_inst, new_date.date, new_date.month, new_date.year);
    }
    else if (clk->state == STATE_TICKING) {
        Lvgl_display_day(&clk->lvgl_inst, g_days[new_date.day]);
        Lvgl_display_month(&clk->lvgl_inst, g_months[new_date.month - 1]);
        Lvgl_display_date(&clk->lvgl_inst, new_date.date);
        Lvgl_display_year(&clk->lvgl_inst, new_date.year);
    }
}

void ClockUI_process_event(ClockUI* const clk, UI_event_t* event)
{
    event_t e = event->event;


    if (e == E_SETTING) {
        lvgl_setting_page_data_t setting_page_data;
        memset(&setting_page_data, 0, sizeof(lvgl_setting_page_data_t));

        clk->usr_setting.time_now = convert_24hformat_to_12h(clk->clock_inst.time_now);
        clk->usr_setting.alarm_time = convert_24hformat_to_12h(clk->clock_inst.alarm_time);
        clk->usr_setting.time_format = Clock_get_am_or_pm(clk->clock_inst.time_now);
        clk->usr_setting.alarm_time_format = Clock_get_am_or_pm(clk->clock_inst.alarm_time);

        clk->setting_save.time_now = clk->usr_setting.time_now;
        clk->setting_save.alarm_time = clk->usr_setting.alarm_time;
        clk->setting_save.time_format = clk->usr_setting.time_format;
        clk->setting_save.alarm_time_format = clk->usr_setting.alarm_time_format;

        uint32_t tmp = clk->usr_setting.time_now;
        setting_page_data.clock_hour = GET_HOUR(tmp);
        setting_page_data.clock_min = GET_MIN(tmp);
        setting_page_data.clock_sec = GET_SEC(tmp);
        setting_page_data.clock_format = Clock_get_am_or_pm(clk->clock_inst.time_now);
        setting_page_data.clock_mode = clk->clock_inst.time_mode;

        tmp = clk->usr_setting.alarm_time;
        setting_page_data.alarm_hour = GET_HOUR(tmp);
        setting_page_data.alarm_min = GET_MIN(tmp);
        setting_page_data.alarm_sec = GET_SEC(tmp);
        setting_page_data.alarm_format = Clock_get_am_or_pm(clk->clock_inst.alarm_time);
//        setting_page_data.alarm_status = clk->clock_inst.alarm_status;


        date_t date_now;
        Clock_get_date(&clk->clock_inst, &date_now);
        memcpy(&clk->usr_setting.date_now, &date_now, sizeof(date_t));
        memcpy(&clk->setting_save.date_now, &date_now, sizeof(date_t));

        setting_page_data.day = date_now.day;
        setting_page_data.date = date_now.date;
        setting_page_data.month = date_now.month;
        setting_page_data.year = date_now.year;


        Lvgl_screen_cleanup(&clk->lvgl_inst);
        clk->state = STATE_SETTING;
        Lvgl_create_setting_page(&clk->lvgl_inst, &setting_page_data);
        ClockUI_update_current_time(clk);
        ClockUI_update_current_date(clk);
    }
    else if (e == E_ROOT_BACK) {
        if (was_settings_changed(clk)) {
            //display if something is changed
            static const char* options[] = { "Yes","No","" };
            Lvgl_create_message_box(&clk->lvgl_inst, "Settings", "Save changes?", options, false);
        }
        else {
            //display if nothing was changed
            clk->state = STATE_TICKING;
            Lvgl_screen_cleanup(&clk->lvgl_inst);
            Lvgl_create_main_page(&clk->lvgl_inst);
            Lvgl_main_page_set_style(&clk->lvgl_inst);
            ClockUI_update_current_time(clk);
            ClockUI_update_current_date(clk);
        }

    }
    else if (e == E_SETTING_SAVE_YES_OR_NO) {
        UI_generic_event_t* e = (UI_generic_event_t*)event;
        uint32_t time_format = 0;
        uint32_t new_time = 0;
        if (e->param == USER_SELECT_YES) {
            if (was_settings_date_changed(clk)) {
                Clock_set_date(&clk->clock_inst, &clk->usr_setting.date_now);
            }
            else if (was_settings_time_changed(clk)) {
                time_format = clk->usr_setting.time_format;
                new_time = convert_12hformat_to_24h(clk->usr_setting.time_now, time_format);
                Clock_set_current_time(&clk->clock_inst, new_time);
            }
            else if (was_settings_alarm_changed(clk)) {
                time_format = clk->usr_setting.alarm_time_format;
                new_time = convert_12hformat_to_24h(clk->usr_setting.alarm_time, time_format);
                Clock_set_alarm_time(&clk->clock_inst, new_time);
            }
        }
        else {
            //do nothiing
            ;
        }
        UI_STATE_CHANGE(STATE_TICKING);
        Lvgl_screen_cleanup(&clk->lvgl_inst);
        Lvgl_create_main_page(&clk->lvgl_inst);
        Lvgl_main_page_set_style(&clk->lvgl_inst);
        ClockUI_update_current_time(clk);
        ClockUI_update_current_date(clk);
    }
    else if (e == E_SETTING_CLOCK_HOUR) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint32_t hour = e->param;
        clk->usr_setting.time_now -= GET_HOUR(clk->usr_setting.time_now) * 3600UL;
        clk->usr_setting.time_now += hour * 3600UL;
    }
    else if (e == E_SETTING_CLOCK_MIN) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint32_t min = e->param;
        clk->usr_setting.time_now -= GET_MIN(clk->usr_setting.time_now) * 60UL;
        clk->usr_setting.time_now += min * 60UL;
    }
    else if (e == E_SETTING_CLOCK_SEC) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint32_t sec = e->param;
        clk->usr_setting.time_now -= GET_SEC(clk->usr_setting.time_now);
        clk->usr_setting.time_now += sec;
    }
    else if (E_SETTING_CLOCK_FORMAT == e) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint8_t id = e->param;
        if (id == 0) {
            clk->usr_setting.time_format = FORMAT_AM;
        }
        else if (id == 1) {
            clk->usr_setting.time_format = FORMAT_PM;
        }
    }
    else if (E_SETTING_CLOCK_MODE == e) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        clk->clock_inst.time_mode = e->param;
    }
    else if (e == E_SETTING_ALARM_HOUR) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint32_t hour = e->param;
        clk->usr_setting.alarm_time -= GET_HOUR(clk->usr_setting.alarm_time) * 3600UL;
        clk->usr_setting.alarm_time += hour * 3600UL;
    }
    else if (e == E_SETTING_ALARM_MIN) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint32_t min = e->param;
        clk->usr_setting.alarm_time -= GET_MIN(clk->usr_setting.alarm_time) * 60UL;
        clk->usr_setting.alarm_time += min * 60UL;
    }
    else if (E_SETTING_ALARM_FORMAT == e) {
        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
        uint8_t id = e->param;
        if (id == 0) {
            clk->usr_setting.alarm_time_format = FORMAT_AM;
        }
        else if (id == 1) {
            clk->usr_setting.alarm_time_format = FORMAT_PM;
        }
    }
    else if (E_SETTING_DATE_CHANGE == e) {
        UI_date_change_event_t* e = (UI_date_change_event_t*)event;
        clk->usr_setting.date_now.day = get_day_of_week(e->year, e->month, e->date);
        clk->usr_setting.date_now.month = e->month;
        clk->usr_setting.date_now.year = e->year;
        clk->usr_setting.date_now.date = e->date;
    }
    else if (E_DATE_SAVE == e) {
        //save the date!
        memcpy(&clk->setting_save.date_now, &clk->usr_setting.date_now, sizeof(date_t));
        Clock_set_date(&clk->clock_inst, &clk->usr_setting.date_now);
        ClockUI_update_current_date(clk);
    }
    else if (E_CLOCK_SAVE == e) {
        clk->setting_save.time_now = clk->usr_setting.time_now;
        clk->setting_save.time_format = clk->usr_setting.time_format;
        uint32_t time_format = clk->usr_setting.time_format;
        uint32_t new_time = convert_12hformat_to_24h(clk->usr_setting.time_now, time_format);
        Clock_set_current_time(&clk->clock_inst, new_time);
    }
    else if (E_ALARM_SAVE == e) {
        clk->setting_save.alarm_time = clk->usr_setting.alarm_time;
        clk->setting_save.alarm_time_format = clk->usr_setting.alarm_time_format;
        uint32_t time_format = clk->usr_setting.alarm_time_format;
        uint32_t new_time = convert_12hformat_to_24h(clk->usr_setting.alarm_time, time_format);
        Clock_set_alarm_time(&clk->clock_inst, new_time);
    }
//    else if (E_ALARM_ON_OR_OFF == e) {
//        UI_time_change_event_t* e = (UI_time_change_event_t*)event;
//        clk->clock_inst.alarm_status = e->param;
//    }
}



void ClockUI_init(ClockUI* const clk) {

    UI_STATE_CHANGE(STATE_TICKING);
    Clock_init(&clk->clock_inst);


    Lvgl_ctor(&clk->lvgl_inst);
    Lvgl_create_main_page(&clk->lvgl_inst);
    Lvgl_main_page_set_style(&clk->lvgl_inst);


    ClockUI_update_current_time(clk);
    ClockUI_update_current_date(clk);
}



static uint32_t convert_24hformat_to_12h(uint32_t time24h) {
    uint8_t hour;
    uint32_t time12h;
    hour = GET_HOUR(time24h);

    if (hour == 0)
        time12h = time24h + (12UL * 3600UL);
    else {
        if ((hour < 12UL) || (hour == 12UL))
            return time24h;
        else
            time12h = time24h - (12UL * 3600UL);
    }
    return time12h;
}



static uint32_t convert_12hformat_to_24h(uint32_t time12h, time_format_t ampm) {
    uint8_t hour;
    uint32_t time24h;
    hour = GET_HOUR(time12h);
    if (ampm == FORMAT_AM) {
        time24h = (hour == 12) ? (time12h - (12UL * 3600UL)) : time12h;
    }
    else {
        time24h = (hour == 12) ? time12h : (time12h + (12UL * 3600UL));
    }
    return time24h;
}

static uint8_t get_day_of_week(uint32_t year, uint32_t month, uint32_t day)
{
    uint32_t a = month < 3 ? 1 : 0;
    uint32_t b = year - a;

#if LV_CALENDAR_WEEK_STARTS_MONDAY
    uint32_t day_of_week = (day + (31 * (month - 2 + 12 * a) / 12) + b + (b / 4) - (b / 100) + (b / 400) - 1) % 7;
#else
    uint32_t day_of_week = (day + (31 * (month - 2 + 12 * a) / 12) + b + (b / 4) - (b / 100) + (b / 400)) % 7;
#endif

    return day_of_week;
}


//debugging functions


bool was_settings_date_changed(const ClockUI* const me) {
    if ((me->setting_save.date_now.day != me->usr_setting.date_now.day) || \
        (me->setting_save.date_now.date != me->usr_setting.date_now.date) || \
        (me->setting_save.date_now.month != me->usr_setting.date_now.month) || \
        (me->setting_save.date_now.year != me->usr_setting.date_now.year)) {
        return true;
    }
    LV_LOG_USER("date was not changed\n");
    return false;
}

bool was_settings_time_changed(const ClockUI* const me) {
    uint32_t time24 = convert_12hformat_to_24h(me->usr_setting.time_now, me->usr_setting.time_format);
    if (convert_12hformat_to_24h(me->setting_save.time_now, me->setting_save.time_format) != time24) {
        return true;
    }
    LV_LOG_USER("time was not changed\n");
    return false;
}

bool was_settings_alarm_changed(const ClockUI* const clk) {
    uint32_t time24 = convert_12hformat_to_24h(clk->usr_setting.alarm_time, clk->usr_setting.alarm_time_format);
    if (convert_12hformat_to_24h(clk->setting_save.alarm_time, clk->setting_save.alarm_time_format) != time24) {
        return true;
    }
    LV_LOG_USER("alarm ws not changed\n");
    return false;
}


static bool was_settings_changed(const ClockUI* const clk)
{
    if (was_settings_date_changed(clk) == true) {
        return true;
    }
    else if (was_settings_time_changed(clk)) {
        return true;
    }
    else if (was_settings_alarm_changed(clk)) {
        return true;
    }
    else {
        return false;
    }
}
