# LCD Clock 
A simple digital clock project that displays the current time information on an LCD screen with added functionality to change the date and time settings as well as the alarm settings. 

## **Key Features**

- **Digital Clock**: Displays current date and time on the LCD screen. Supports time/date adjustment and alarm settings.
- **Touchscreen Interaction**: Interact with the clock using a touchscreen powered by the XPT2046 touch controller. Use the settings button on the top right of the screen to change configurations.
- **LVGL Graphics Library**: Used for efficent LCD drawing functionality and fonts/colours. 
- **Interrupt Handling**: Touchscreen input is managed via interrupts, when the touchscreen controller detects intput it creates an event and signals the microcontroller to updates the screen accordingly.
- **SPI Interface**: Used for communication with the LCD and touchscreen modules.

## **Project Setup**

- **LCD Screen**: ILI9341 with built-in touchscreen controller (SPI-compatible).
- **Microcontroller**: STM32F407-DISC1 board

### **Pin Connections**

#### LCD Display Pins:
- **LED**, **VCC** → 5V on STM32 board  
- **GND** → GND on STM32 board  
- **MISO** → PC2  
- **MOSI** → PB15  
- **SCK** → PB13  
- **DC** → PD9  
- **RESET** → PD10  
- **CS** → PB9  

#### Touchscreen Pins:
- **IRQ** → PA8  
- **CS** → PA15  
- **DIN** → PA7  
- **DO** → PA6  
- **CLK** → PA5  

