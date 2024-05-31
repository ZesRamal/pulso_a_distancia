import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String nombre;
  final List<String> usuariosMonitoriando;
  final String celular;
  final String correo;
  final List<Map<String, dynamic>> historialBPM;
  final String password;

  Usuario({
    required this.nombre,
    required this.usuariosMonitoriando,
    required this.celular,
    required this.correo,
    required this.historialBPM,
    required this.password,
  });

  

  factory Usuario.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Usuario(
      nombre: data['Nombre'] ?? '',
      usuariosMonitoriando: List<String>.from(data['UsuariosMonitoriando'] ?? []),
      celular: data['celular'] ?? '',
      correo: data['correo'] ?? '',
      historialBPM: List<Map<String, dynamic>>.from(data['historialBPM'] ?? []),
      password: data['password'] ?? '',
    );
  }
}
