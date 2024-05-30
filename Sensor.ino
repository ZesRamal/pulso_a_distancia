#include <PulseSensorPlayground.h>
#include "BluetoothSerial.h"

#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run make menuconfig to and enable it
#endif

BluetoothSerial SerialBT;

const int PULSE_INPUT = A0; // Ajusta el pin de entrada analógica según corresponda
const int PULSE_BLINK = 2;  // Utiliza el pin 2 para el LED incorporado en ESP32 WROOM 32
const int THRESHOLD = 550;

PulseSensorPlayground pulseSensor;

void setup() {
  Serial.begin(115200);
  
  pulseSensor.analogInput(PULSE_INPUT);
  pulseSensor.blinkOnPulse(PULSE_BLINK);
  pulseSensor.setThreshold(THRESHOLD);
  
  SerialBT.begin("ESP32test"); // Nombre del dispositivo Bluetooth
  Serial.println("El dispositivo ha iniciado, ¡ahora puedes emparejarlo con Bluetooth!");
  
  if (pulseSensor.begin()) {
    Serial.println("Se ha creado el objeto pulseSensor correctamente!");
  }
}

void loop() {
  if (pulseSensor.sawStartOfBeat()) {
    int myBPM = pulseSensor.getBeatsPerMinute();
    Serial.println("♥ Se ha detectado un latido!");
    Serial.print("BPM: ");
    Serial.println(myBPM);
    SerialBT.print("BPM: ");
    SerialBT.println(myBPM); // Envía los BPM por Bluetooth
  }

  if (Serial.available()) {
    int data = Serial.read(); // Lee los datos del puerto serial
    SerialBT.write(data);     // Envía los datos al móvil a través de Bluetooth
  }

  if (SerialBT.available()) {
    int data = SerialBT.read(); // Lee los datos recibidos por Bluetooth
    Serial.write(data);         // Escribe los datos en el puerto serial
  }

  delay(20); // Pequeño retraso para evitar sobrecarga del procesador
}