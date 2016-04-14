int light = 0;
int limit = 300;
void setup() {
  pinMode(10, OUTPUT);
  pinMode(A3, INPUT);
  Serial.begin(9600);
}

void loop() {
    light = analogRead(A3);
    
    Serial.println(light);
    delay(200);

    if(light>limit)
    {
      digitalWrite(10, HIGH);
      limit = 200;
    }
    else
    {
      digitalWrite(10, LOW);
      limit = 400;
    }
}
