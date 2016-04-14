
// • Salida digitales para LEDs: PIN9, PIN10, PIN11
// • Salida digital para zumbador: PIN7
// • Entrada analógica para potenciómetro: PIN A1
// • Entrada analógica para electrodos: PIN A0

void setup()
{
  pinMode(10, OUTPUT);
  pinMode(9, OUTPUT);
  pinMode(8, OUTPUT);
  pinMode(7, OUTPUT);
  pinMode(A1, INPUT);
  pinMode(A0, INPUT);
  Serial.begin(9600);
}

void loop()
{
  Serial.println(analogRead(A0));
  delay(300);
  if(analogRead(A0)>analogRead(A1)+250)
  {
    digitalWrite(10, HIGH);
    digitalWrite(9, LOW);
    digitalWrite(8, LOW);
    
    tone(7, 329.63, 300);
    delay(350);
  }
  else if(analogRead(A0)<analogRead(A1)-250)
  {
    digitalWrite(10, LOW);
    digitalWrite(9, HIGH);
    digitalWrite(8, LOW);
  }
  else
  {
    digitalWrite(10, LOW);
    digitalWrite(9, LOW);
    digitalWrite(8, HIGH);
  }
}
