#include <PulseSensorPlayground.h>
#include "BluetoothSerial.h" 
//Asegura que el bluetooth esté habilitado, de lo contrario muestra el error.
#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth no está habilitado! Por favor, ejecuta make menuconfig para habilitarlo
#endif

BluetoothSerial SerialBT;

const int PULSO_INPUT = A0; // Ajusta el pin de entrada analógica según corresponda.
const int PULSO_BLINK = 2;  // Utiliza el pin 2 para el LED incorporado en ESP32 WROOM 32.
const int UMBRAL = 550;     // Valor establecido para el umbral del sensor.

PulseSensorPlayground pulseSensor; // Creación del objeto PulseSensorPlayground.

void setup() {
  Serial.begin(115200);
  
  pulseSensor.analogInput(PULSO_INPUT); //pulseSensor.analogInput(PULSE_INPUT): Configura el pin de entrada analógica para el sensor de pulso.
  pulseSensor.blinkOnPulse(PULSO_BLINK); //pulseSensor.blinkOnPulse(PULSO_BLINK): Configura el LED para que parpadee con cada latido.
  pulseSensor.setThreshold(UMBRAL); //pulseSensor.setThreshold(UMBRAL): Establece el umbral de detección de latidos.
  
  SerialBT.begin("ESP32test"); //SerialBT.begin("ESP32test"): Inicia la comunicación Bluetooth con el nombre "ESP32test".
  Serial.println("El dispositivo ha iniciado, ¡ahora puedes emparejarlo con Bluetooth!");
  
  if (pulseSensor.begin()) {
    Serial.println("¡Se ha creado el objeto pulseSensor correctamente!");
  }
}

void loop() {
  if (pulseSensor.sawStartOfBeat()) {//Detección de Latidos: Usa sawStartOfBeat() para verificar si se detectó un nuevo latido.
    int miBPM = pulseSensor.getBeatsPerMinute();//Obtención de BPM: Usa getBeatsPerMinute() para obtener la frecuencia cardíaca en BPM.
    //Imprime los datos en el puerto Serial
    Serial.println("♥ ¡Se ha detectado un latido!");
    Serial.print("BPM: ");
    Serial.println(miBPM);
    SerialBT.print("BPM: ");
    SerialBT.println(miBPM); // Envía los BPM por Bluetooth
  }

  if (Serial.available()) {
    int datos = Serial.read(); // Lee los datos del puerto serial
    SerialBT.write(datos);     // Envía los datos al móvil a través de Bluetooth
  }

  if (SerialBT.available()) {
    int datos = SerialBT.read(); // Lee los datos recibidos por Bluetooth
    Serial.write(datos);         // Escribe los datos en el puerto serial
  }

  delay(20); // Pequeño retraso para evitar sobrecarga del procesador
}
