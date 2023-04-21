#include <LCD_I2C.h>
 
#define trigPin 8
#define echoPin 9
 
LCD_I2C lcd(0x3F, 16, 2);
 
 
const int buttonPin = 2;
int buttonState = LOW;
int last = LOW;
 
byte jadra[8]{
  0b01110,
  0b11111,
  0b11111,
  0b01111,
  0b01111,
  0b11111,
  0b11111,
  0b01110};
 
 byte chuj[8]{
  0b00000,
  0b00000,
  0b00000,
  0b11111,
  0b11111,
  0b00000,
  0b00000,
  0b00000
  };
   byte koncowka[8]{
  0b00000,
  0b00000,
  0b00110,
  0b11111,
  0b11111,
  0b00110,
  0b00000,
  0b00000
  };
 
byte batman[8]{
 
  0b10001,
  0b11111,
  0b11111,
  0b10101,
  0b11111,
  0b10001,
  0b01110,
  0b00000
  };
 
// Define variables:
long duration;
int distance;
 
void setup() {
  // Define inputs and outputs: 
  pinMode(buttonPin, INPUT_PULLUP);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
 
  //Begin Serial communication at a baudrate of 9600:
  lcd.begin();
  lcd.backlight();
  lcd.createChar(0, batman);
  lcd.createChar(1, jadra);
  lcd.createChar(2, chuj);
  lcd.createChar(3, koncowka);
}
 
void loop() {
  buttonState = digitalRead(buttonPin);
  // Clear the trigPin by setting it LOW:
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
 
  // Trigger the sensor by setting the trigPin high for 10 microseconds:
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
 
  // Read the echoPin, pulseIn() returns the duration (length of the pulse) in microseconds:
  duration = pulseIn(echoPin, HIGH);
  // Calculate the distance:
  distance = duration * 0.034 / 2;
  if(buttonState == LOW){
    lcd.clear();
    lcd.write(byte(1));
      for(int i = 0; i< distance; i++){
    lcd.write(byte(2));
      }
      lcd.write(byte(3));
  }
 
  delay(500);
}
