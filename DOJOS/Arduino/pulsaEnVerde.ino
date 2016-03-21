int light = 0;

void setup()
{
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, INPUT);
}

void loop()
{
    light = random(5,10);
    digitalWrite(light, HIGH); delay(250);
    if(digitalRead(11)==HIGH && light==7)
    {
      tone(10, 329.63, 300);
      delay(350);
    }
    digitalWrite(light, LOW);
}
