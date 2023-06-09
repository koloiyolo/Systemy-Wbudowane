/*
  Button

  Turns on and off a light emitting diode(LED) connected to digital pin 13,
  when pressing a pushbutton attached to pin 2.

  The circuit:
  - LED attached from pin 13 to ground through 220 ohm resistor
  - pushbutton attached to pin 2 from +5V
  - 10K resistor attached to pin 2 from ground

  - Note: on most Arduinos there is already an LED on the board
    attached to pin 13.

  created 2005
  by DojoDave <http://www.0j0.org>
  modified 30 Aug 2011
  by Tom Igoe

  This example code is in the public domain.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/Button
*/

// constants won't change. They're used here to set pin numbers:
const int buttonPin = 2;     // the number of the pushbutton pin
     // the number of the LED pin

// variables will change:
int buttonState = 0;
int i=4; //inicjalizacja pierwsxzego wyjscia
int last = LOW; //zmienne pomocnicze
int lastb = LOW;
// variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT_PULLUP);
}

void loop() {
  if(i == 13)i= 4;
  pinMode(i, OUTPUT); //za kazdym razem inicjalizowac pinmode dla kazdego wyjscia
  buttonState = digitalRead(buttonPin);
  if(buttonState == HIGH && lastb != buttonState && last == LOW){
    // turn LED on:
   last = HIGH;
   i++;
    } else  if(buttonState == HIGH && lastb != buttonState && last == HIGH){
    // turn LED off:
   last = LOW;
   }
   lastb = buttonState;
   digitalWrite(i, last); //wywolanie swiecenia
   delay(100);
}
 
