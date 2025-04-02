// Importa el paquete principal de Flutter que contiene los widgets y herramientas necesarias.
import 'package:flutter/material.dart';

// Importa la pantalla de bienvenida desde el archivo correspondiente.
import 'package:flutter_application_caffe_shop/screens/welcome_screend.dart';

// Función principal que inicia la aplicación Flutter.
void main() => runApp(MyApp());

// Define la clase MyApp que extiende StatelessWidget, lo que significa que es un widget inmutable.
class MyApp extends StatelessWidget {
  // Constructor de la clase MyApp. 'super.key' es una clave que ayuda a identificar el widget en el árbol de widgets.
  const MyApp({super.key});

  // Método que construye la interfaz de usuario del widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Oculta la etiqueta de "debug" en la esquina superior derecha de la aplicación.
      debugShowCheckedModeBanner: false,
      // Define el tema de la aplicación.
      theme: ThemeData(
        // Establece el color de fondo predeterminado para los widgets Scaffold en toda la aplicación.
        scaffoldBackgroundColor: Color(0xFF212325), // Color de fondo oscuro.
      ),
      // Establece la pantalla de inicio de la aplicación.
      home: WelcomeScreen(),
    );
  }
}
