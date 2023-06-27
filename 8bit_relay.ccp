
const int latchPin = 8;   // Pin ST_CP (Pin 12 trên IC 74HC595)
const int clockPin = 9;   // Pin SH_CP (Pin 11 trên IC 74HC595)
const int dataPin = 10;   // Pin DS (Pin 14 trên IC 74HC595)

void setup(){
 pinMode(clockPin, OUTPUT);
 pinMode(latchPin, OUTPUT);
 pinMode(dataPin, OUTPUT);
 update_byte(0);
}
void loop(){
update_byte(0b00001000);
}
void update_byte(byte Binary){
  digitalWrite(clockPin, LOW);
  for(int bit = 0; bit <= 7; bit++){
    bool true_false = (Binary >> bit) & 1;
    digitalWrite(dataPin, true_false);
    digitalWrite(clockPin, HIGH);
    digitalWrite(clockPin, LOW);
  }
  digitalWrite(latchPin, HIGH);
  digitalWrite(latchPin, LOW);
}
