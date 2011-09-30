#include <Servo.h>

#define OPEN_VALUE 20
#define CLOSE_VALUE 125
#define POT_PIN 0

Servo servo;

void setup() {
    Serial.begin(9600);
    servo.attach(9);
}

void loop() {
    openDoor();
    delay(1000);
    closeDoor();
    delay(1000);
}

void setFromPot() {
    int val = analogRead(POT_PIN);
    val = map(val, 0, 1023, 0, 179);
    Serial.println("Setting door to: ");
    Serial.println(val, DEC);
    servo.write(val);
    delay(1000);
}

void openDoor() {
    Serial.println("Opening door");
    servo.write(OPEN_VALUE);
}

void closeDoor() {
    Serial.println("Closing door");
    servo.write(CLOSE_VALUE);
}
