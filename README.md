# LCD Clock 
A simple digital clock project that displays the current time information on an LCD screen with added functionality to change the date and time settings as well as the alarm settings. 

__Key Features:__
Digital Clock: Displays current date and time on LCD screen. Supports time and date changing, alarm settings


Touchscreen Interaction: Allows the user to interact with the clock using a touchscreen, powered by the XPT2046 touch controller. Using the touchscreen you can change the settings by pressing the settings button. 


LVGL Graphics Library: Utilizes the LVGL embedded graphics library for efficient LCD drawing functionality.


Interrupt Handling: Touchscreen input is managed via interrupts, and communication between the XPT2046 module and the microcontroller. Depending on the event type, the microcontroller will handle what to draw on the screen next. 


SPI Interface: Used for communication with the LCD and touchscreen module

__Project Setup__
LCD screen with touchscreen controller (compatible with SPI ): I used the ILI9341 
Microcontroller: I used STM32F407-DISC1 board 


The pin-out connection between the LCD screen and the microcontroller is as follows:

  Connect LED and VCC on the LCD screen to 5V on STM32 board
  Connect GND on LCD screen to GND on STM32 board 
  Display pins on LCD screen
  MISO to PC2
  MOSI to PB15
  SCK to PB13 
  DC to PD9
  RESET to PD10
  CS to PB9 
  Touch pins on LCD:
  IRQ to PA8
  CS to PA15
  DIN to PA7
  DO to PA6
  CLK to PA5

