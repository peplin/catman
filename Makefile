TARGET       = catman
BOARD_TAG    = diecimila

ARDUINO_PORT = /dev/ttyUSB*
ARDUINO_LIBS = Servo SoftwareSerial

include $(ARDUINO_MAKEFILE_HOME)/Arduino.mk
