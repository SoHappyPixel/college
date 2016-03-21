int fadeVal = 0;
void setup() {
    pinMode(8, OUTPUT);
    pinMode(7, OUTPUT);
    pinMode(6, OUTPUT);
    pinMode(A1, INPUT);
}

void loop() {
  fadeVal = analogRead(A1);
  if(fadeVal>0 && fadeVal<500)
  {
    digitalWrite(8, HIGH);
    digitalWrite(7, LOW);
    digitalWrite(6, LOW);
  }
  if(fadeVal>500 && fadeVal<850)
  {
    digitalWrite(8, LOW);
    digitalWrite(7, HIGH);
    digitalWrite(6, LOW);
  }
  if(fadeVal>850 && fadeVal<1023)
  {
    digitalWrite(8, LOW);
    digitalWrite(7, LOW);
    digitalWrite(6, HIGH);
  }
}
