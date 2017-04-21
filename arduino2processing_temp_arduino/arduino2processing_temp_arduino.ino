void setup() {
  Serial.begin(115200);

  while (Serial.available() <= 0) {
    Serial.println('a');   // send an initial string
    delay(300);
  }
}

void loop() {
  if (Serial.available() > 0) {
    char temp = Serial.read();
    Serial.println("OK");
  }
}
