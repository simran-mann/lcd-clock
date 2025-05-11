/**
 * @file indev.c
 *
 */

/*********************
 *      INCLUDES
 *********************/
#include "tft.h"
#include "lvgl.h"

#include "stm32f4xx.h"
#include "XPT2046.h"

/*********************
 *      DEFINES
 *********************/

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**
 * Initialize your input devices here
 */
void touchpad_init(void)
{
  //stmpe811_Init(TS_I2C_ADDRESS);
 // stmpe811_TS_Start(TS_I2C_ADDRESS);

  xpt2046_init();
  static lv_indev_drv_t indev_drv;
  lv_indev_drv_init(&indev_drv);
  indev_drv.read_cb = xpt2046_read;
  indev_drv.type = LV_INDEV_TYPE_POINTER;
  lv_indev_drv_register(&indev_drv);
}


static bool touchpad_read(lv_indev_drv_t * drv, lv_indev_data_t *data)
{
static int16_t last_x = 0;
static int16_t last_y = 0;

bool detected;
int16_t x;
int16_t y;
detected = touchpad_get_xy(&x, &y);
/*
* In MB1075-F429I-E01 Board Schematic the touch is flipped vertically, so needed to flip
* The data from touch to working. So Y axe is flipped vertically and added 20 as an offset.
* */
y = TFT_VER_RES - (y+20) ;

if(detected) {
data->point.x = x;
data->point.y = y;
last_x = data->point.x;
last_y = data->point.y;

data->state = LV_INDEV_STATE_PR;
} else {
data->point.x = last_x;
data->point.y = last_y;
data->state = LV_INDEV_STATE_REL;
}

return false;
}


