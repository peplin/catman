#include <Servo.h>

#define OPEN_VALUE 20
#define CLOSE_VALUE 125
#define SWITCH_PIN 7

#define OPEN 1
#define CLOSED 0

Servo servo;
int currentPosition;

void setup() {
    Serial.begin(9600);
    pinMode(SWITCH_PIN, INPUT);
    servo.attach(9);

    currentPosition = CLOSED;
}

void loop() {
    int val = digitalRead(SWITCH_PIN);
    if(val != currentPosition) {
        setDoorPosition();
        currentPosition = val;
    }
    delay(50);
}

void setDoorPosition() {
    if(currentPosition == OPEN) {
        openDoor();
    } else {
        closeDoor();
    }
}

void openDoor() {
    Serial.println("Opening door");
    servo.write(OPEN_VALUE);
}

void closeDoor() {
    Serial.println("Closing door");
    servo.write(CLOSE_VALUE);
}
