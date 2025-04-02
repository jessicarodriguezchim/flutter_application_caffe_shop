import "package:flutter/material.dart"; // Importa la librería principal de Flutter

// Widget sin estado que representa la pestaña de espressos en venta
class EspressoTab extends StatelessWidget {
  // Función que recibe el precio del espresso y lo agrega al carrito
  final Function(double) addToCart;

  // Constructor del widget
  EspressoTab({super.key, required this.addToCart});

  // Lista de espressos en venta con sus atributos: [nombre, tienda, precio, color, imagen]
  final List<List<dynamic>> espressoSale = [
    ["Espresso", "Starbucks", "90", Colors.brown, "assets/images/Espresso.png"],
    [
      "Double Espresso",
      "Dunkin",
      "120",
      Colors.deepOrange,
      "assets/images/Espresso.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: espressoSale.length, // Número total de espressos a mostrar
      padding: const EdgeInsets.all(
        8.0,
      ), // Espaciado alrededor de la cuadrícula
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Cantidad de columnas en la cuadrícula
        childAspectRatio: 1 / 1.5, // Relación de aspecto de cada elemento
      ),
      itemBuilder: (context, index) {
        return EspressoTile(
          flavor: espressoSale[index][0], // Nombre del espresso
          store: espressoSale[index][1], // Tienda donde se vende
          price: double.parse(
            espressoSale[index][2],
          ), // Precio convertido a double
          color: espressoSale[index][3], // Color asociado al espresso
          imageName: espressoSale[index][4], // Ruta de la imagen del espresso
          onTap: () {
            double price =
                double.tryParse(espressoSale[index][2]) ??
                0; // Convierte el precio y maneja errores
            addToCart(price); // Agrega el espresso al carrito con su precio
          },
        );
      },
    );
  }
}

// Widget sin estado que representa la tarjeta de un espresso individual
class EspressoTile extends StatelessWidget {
  final String flavor; // Nombre del espresso
  final String store; // Nombre de la tienda
  final double price; // Precio del espresso
  final Color color; // Color de fondo asociado al espresso
  final String imageName; // Ruta de la imagen del espresso
  final VoidCallback onTap; // Función que se ejecuta al tocar la tarjeta

  // Constructor de la tarjeta del espresso
  const EspressoTile({
    super.key,
    required this.flavor,
    required this.store,
    required this.price,
    required this.color,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Detecta cuando se toca la tarjeta y ejecuta la función
      child: Card(
        color: color.withOpacity(0.2), // Aplica una opacidad al color de fondo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ), // Bordes redondeados
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Espaciado dentro de la tarjeta
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos verticalmente
            children: [
              Image.asset(
                imageName, // Muestra la imagen del espresso
                height: 100,
                width: 100,
                fit: BoxFit.cover, // Ajusta la imagen sin distorsionarla
              ),
              const SizedBox(height: 8), // Espaciado entre la imagen y el texto
              Text(
                flavor, // Muestra el nombre del espresso
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                store, // Muestra el nombre de la tienda
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                '\$${price.toStringAsFixed(2)}', // Muestra el precio con dos decimales
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
