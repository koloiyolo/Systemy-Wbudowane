#include <LCD_I2C.h>

const int red = 3;
const int blue = 2;
int counter = 0;
enum PILL {
  _NULL,
  BLUE,
  RED 
}pill;

LCD_I2C lcd(0x27, 16, 2);
 
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(red, INPUT_PULLUP);
  pinMode(blue, INPUT_PULLUP);
  lcd.begin();
  lcd.backlight();
  lcd.print("Witaj Neo");
  delay(1000);

  attachInterrupt(digitalPinToInterrupt(red), redpill, LOW);
  attachInterrupt(digitalPinToInterrupt(blue), bluepill, LOW);
}
 
void redpill(){
  pill = RED;
}

void bluepill(){
  pill = BLUE;
}


void loop() {
  delay(300);
  lcd.clear();
  lcd.print( 
    pill == RED ? 
      ((counter%2==0)? "10101010101010101" : "01010101010101010") 
      : pill == BLUE ?"Budzisz sie" 
        : "Chcesz poznac");

  lcd.setCursor(0, 1);

  lcd.print( 
    pill == RED ? 
      ((counter%2==0)? "01010101010101010" : "10101010101010101")
        : pill == BLUE ?"na chacie" 
          : "prawde?");
  counter++;
  
}
