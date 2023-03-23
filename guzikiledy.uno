// constants won't change. They're used here to set pin numbers:
const int buttonPin = 2;     // the number of the pushbutton pin
     // the number of the LED pin

// variables will change:
int buttonState = 0;
int i = 8; 
int last = LOW;
int lastb = LOW;
// variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  pinMode(i, OUTPUT);
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT_PULLUP);
}

void loop() {
  if(i == 13)i= 4;
 
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
   digitalWrite(i, last);
}
