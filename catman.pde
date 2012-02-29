#include <Servo.h>
#include <SoftwareSerial.h>

#define CLOSED_POSITION 150
#define OPEN_POSITION 90
#define SWITCH_PIN 7
#define SERVO_PIN 9
#define FEEDING_DURATION 800

Servo servo;
int lastSwitchPosition;

SoftwareSerial remoteSerial = SoftwareSerial(2, 3);

void setup() {
    Serial.begin(115200);
    remoteSerial.begin(9600);
    pinMode(SWITCH_PIN, INPUT);
    servo.attach(SERVO_PIN);

    lastSwitchPosition = 0;
}

void openDoor() {
    Serial.println("Opening the door");
    servo.write(OPEN_POSITION);
}

void closeDoor() {
    Serial.println("Closing the door");
    servo.write(CLOSED_POSITION);
}

void feedEm() {
    openDoor();
    delay(FEEDING_DURATION);
    closeDoor();
}

void loop() {
    int val = digitalRead(SWITCH_PIN);
    char controlCode = NULL;
    if(remoteSerial.available()) {
        controlCode = (char) remoteSerial.read();
    }

    if(val != lastSwitchPosition || controlCode == 'F') {
        feedEm();
        lastSwitchPosition = val;
    }
    delay(50);

}
