#include <LCD_I2C.h>
#include <Wire.h>
 
const int buttonPin = 4;
int buttonState = LOW;
 
LCD_I2C lcd(0x27, 16, 2);
 
void setup()
{
    pinMode(buttonPin, INPUT_PULLUP);
    Serial.begin(9600);
    last = digitalRead(buttonPin);
    lcd.begin();
    lcd.backlight();
}
 
void loop()
{
    buttonState = digitalRead(buttonPin);
 
    if (buttonState == LOW) {
        lcd.print("Penis Dupa Cyce");
        lcd.setCursor(0, 1);
        lcd.print("OtoSlowoPanskie!");
    } else {
        lcd.print("Jak Pan Jezus");
        lcd.setCursor(0, 1);
        lcd.print("powiedzial?");
    }
    last = buttonState;
    delay(500);
    lcd.clear();
}