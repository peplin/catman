#include <Servo.h>

#define CLOSED_POSITION 150
#define OPEN_POSITION 90
#define SWITCH_PIN 7
#define SERVO_PIN 9
#define FEEDING_DURATION 800

Servo servo;
int lastSwitchPosition;

void setup() {
    Serial.begin(9600);
    pinMode(SWITCH_PIN, INPUT);
    servo.attach(SERVO_PIN);

    lastSwitchPosition = 0;
}

void loop() {
    int val = digitalRead(SWITCH_PIN);
    if(val != lastSwitchPosition) {
        feedEm();
        lastSwitchPosition = val;
    }
    delay(50);
}

void feedEm() {
    openDoor();
    delay(FEEDING_DURATION);
    closeDoor();
}

void openDoor() {
    Serial.println("Opening the door");
    servo.write(OPEN_POSITION);
}

void closeDoor() {
    Serial.println("Closing the door");
    servo.write(CLOSED_POSITION);
}
