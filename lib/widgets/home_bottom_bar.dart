import 'package:flutter/material.dart';

// Definición de un widget sin estado (StatelessWidget) llamado HomeBottomBar.
class HomeBottomBar extends StatelessWidget {
  // Constructor constante que recibe una clave opcional.
  const HomeBottomBar({super.key});

  // Método que construye la interfaz de usuario del widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      // Padding horizontal de 15 píxeles para el contenido interno del contenedor.
      padding: EdgeInsets.symmetric(horizontal: 15),
      // Altura fija del contenedor establecida en 80 píxeles.
      height: 80,
      // Decoración del contenedor que incluye color de fondo y sombra.
      decoration: BoxDecoration(
        // Color de fondo del contenedor en formato hexadecimal.
        color: Color(0xFF212325),
        // Lista de sombras aplicadas al contenedor.
        boxShadow: [
          BoxShadow(
            // Color de la sombra con una opacidad del 40%.
            color: Colors.black.withOpacity(0.4),
            // Radio de propagación de la sombra.
            spreadRadius: 1,
            // Radio de desenfoque de la sombra.
            blurRadius: 8,
          ),
        ],
      ),
      // Fila que contiene los iconos de la barra de navegación inferior.
      child: Row(
        // Distribuye los elementos de la fila de manera equitativa con espacios entre ellos.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icono de inicio (home) con color y tamaño específicos.
          Icon(Icons.home, color: Color.fromARGB(255, 222, 141, 91), size: 35),
          // Icono de favoritos con color y tamaño específicos.
          Icon(Icons.favorite_outlined, color: Colors.white, size: 35),
          // Icono de notificaciones con color y tamaño específicos.
          Icon(Icons.notifications, color: Colors.white, size: 35),
          // Icono de perfil de usuario con color y tamaño específicos.
          Icon(Icons.person, color: Colors.white, size: 35),
        ],
      ),
    );
  }
}
