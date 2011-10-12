#include <Servo.h>

#define BACKWARD_MOVEMENT 1300
#define FORWARD_MOVEMENT 1800
#define STOP_MOVEMENT 1550
#define SWITCH_PIN 7
#define SERVO_PIN 9
#define SPIN_DURATION 250

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
        backSpin();
        spinWheel(1);
        lastSwitchPosition = val;
    } else {
        stopWheel();
    }
    delay(50);
}

void backSpin() {
    servo.writeMicroseconds(BACKWARD_MOVEMENT);
    delay(100);
}

void spinWheel(int timesAround) {
    Serial.println("Spinning the wheel");
    servo.writeMicroseconds(FORWARD_MOVEMENT);
    delay(SPIN_DURATION * timesAround);
}

void stopWheel() {
    Serial.println("Stopping the wheel");
    servo.writeMicroseconds(STOP_MOVEMENT);
}
