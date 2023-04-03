const int buttonPin = 2;
int buttonState = LOW;
int last = LOW;
 
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(buttonPin, INPUT_PULLUP);
  last = digitalRead(buttonPin);
}
 
void loop() {
  buttonState = digitalRead(buttonPin);
 
  if (buttonState != last && buttonState != HIGH) {
    if(digitalRead(LED_BUILTIN) == HIGH) {
      digitalWrite(LED_BUILTIN, LOW);
    } else {
      digitalWrite(LED_BUILTIN, HIGH);
    }
  }
    last = buttonState;
}
