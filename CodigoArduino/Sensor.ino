#include <ArduinoBLE.h>

const int pulsePin = A0; // Pin A0 para la entrada del sensor
const int blinkPin = 2;  // Pin 2 para el LED de parpadeo
int threshold = 550;     // Ajusta este valor según tu sensor

unsigned long lastBeatTime = 0;
int beatInterval = 0;
int bpm = 0;
bool pulseDetected = false;

BLEService pulseService("180D"); // Servicio de Ritmo Cardíaco (UUID estándar)
BLEUnsignedCharCharacteristic bpmCharacteristic("2A37", BLERead | BLENotify);

void setup() {
  Serial.begin(115200);
  pinMode(pulsePin, INPUT);
  pinMode(blinkPin, OUTPUT);

  // Inicia BLE
  if (!BLE.begin()) {
    Serial.println("Error al iniciar BLE");
    while (1);
  }

  BLE.setLocalName("ESP32_PulseMonitor");
  BLE.setAdvertisedService(pulseService);

  // Agrega la característica al servicio
  pulseService.addCharacteristic(bpmCharacteristic);

  // Agrega el servicio
  BLE.addService(pulseService);

  // Comienza a anunciar
  BLE.advertise();
  Serial.println("Esperando conexión BLE...");
}

void loop() {
  BLEDevice central = BLE.central();

  if (central) {
    Serial.print("Conectado a: ");
    Serial.println(central.address());

    while (central.connected()) {
      int sensorValue = analogRead(pulsePin);

      if (sensorValue > threshold && !pulseDetected) {
        pulseDetected = true;
        digitalWrite(blinkPin, HIGH); // Enciende el LED

        unsigned long currentTime = millis();
        beatInterval = currentTime - lastBeatTime;
        lastBeatTime = currentTime;

        if (beatInterval > 250) {
          bpm = 60000 / beatInterval; // Calcula BPM

          // Limita los BPM a 220
          if (bpm > 220) {
            bpm = 220;
          }

          Serial.print("BPM: ");
          Serial.println(bpm);

          // Envía los BPM a través de BLE
          bpmCharacteristic.writeValue(bpm);
        }
      } else if (sensorValue < threshold) {
        pulseDetected = false;
        digitalWrite(blinkPin, LOW); // Apaga el LED
      }

      delay(10); // Pequeño retraso para estabilizar la lectura
    }

    Serial.print("Desconectado de: ");
    Serial.println(central.address());
  }
}
