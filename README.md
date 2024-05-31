# Pulso a Distancia

### Descripcion de Proyecto
¿Que hace la aplicación?

Permite a los usuarios monitorear datos cardiovasculares propios o de otras personas estos últimos de forma remota, recibiendo alertas en caso de anomalías en las mediciones de los pulsos por minuto del corazón y generando un historial de los diferentes estados para futura referencia. 

La aplicación se integrará con una pulsera con sensores para la medición de datos cardiovasculares. 
La aplicación propone ser una herramienta que facilite a un médico el monitoreo del estado cardiovascular de sus pacientes o el de algún individuo que esté al cuidado de otra persona.

¿Que tecnologia usa?

Software:
* dart versión: 3.3.4-4.0.0
* flutter versión: 3.19.2^
* Android SDK versión: 21^
* Arduino IDE versión: 2.3.2
* Driver 2.0.16 by Espressif Systems (Necesario para trabajar con ESP32)

Hardware:
* ESP-WROOM-32 ESP32 ESP-32S 
* Sensor de pulso fotoeléctrico
  
### ¿Como Instalar y Correr el Proyecto?
Para la parte del hardware es necesario una placa de desarrollo ESP-WROOM-32 ESP32 ESP-32S y un sensor de pulso fotoeléctrico donde le cargaremos el código de arduino

### ¿Como usar el proyecto?
En cualquier parte del cuerpo que cuente con un vaso sanguíneo apoyar el sensor donde capturará los datos del pulso y serán enviados vía bluetooth al dispositivo móvil.

En el móvil, haremos emparejamiento con el módulo de trabajo y en la app nos dirigimos a la sección del perfil del usuario y nos aseguramos de que se establezca conexión a la app, con todo conectado, los datos leídos a través del sensor se empezaran a visualizar en la pantalla principal del móvil del paciente y el móvil del médico y/o familiar a cargo.

### Creditos

* Project Manager: [Oscar Anguiano Gonzalez](https://github.com/Oscar060502)
* Frontend Dev: [Cesar Francisco Ramos Leal](https://github.com/ZesRamal)
* Backend Dev: [Jared Zaragoza Rosales](https://github.com/K0i0s)
* Database Admin: [Ricardo Escobar Ceseña](https://github.com/XPFLASH)

### Licencias

[Licencia MIT](LICENSE)


