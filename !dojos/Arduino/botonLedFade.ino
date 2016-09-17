void setup() {
  // put your setup code here, to run once:
    pinMode(9, OUTPUT);
    pinMode(2, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(2)==HIGH)
  {
    for(int fadeval = 0 ; fadeval <= 255; fadeval+=5)
    {
      analogWrite(9, fadeval);
      delay(100);
    }
  }
  else{ digitalWrite(9, LOW); }
}
