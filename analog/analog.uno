
#include <LCD_I2C.h>
 
 
LCD_I2C lcd(0x3F, 16, 2); // Default address of most PCF8574 modules, change according
 
byte Batman[8] = {
0b10001,
0b11111,
0b10101,
0b11111,
0b10001,
0b11111,
0b01110,
0b00000
};
 
float last = 0;
 
void setup()
{
 
    lcd.begin(); // If you are using more I2C devices using the Wire library use lcd.begin(false)
                 // this stop the library(LCD_I2C) from calling Wire.begin()
    lcd.backlight();
    lcd.createChar(0, Batman);
}
 
void loop()
{
 
 
  int sensorValue = analogRead(A2);
 
    float voltage = sensorValue * (5.0 / 1023.0);
    if(voltage>(last-0.5)&&voltage<(last+0.5)){
      lcd.write(byte(0));
      last = voltage;
      }else{
    lcd.print(voltage);
    lcd.print(" V");
      }
 
delay(150);
lcd.clear();    
}
