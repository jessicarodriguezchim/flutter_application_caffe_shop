import "package:flutter/material.dart"; // Importa la librería principal de Flutter

// Widget sin estado que representa la pestaña de cafés calientes en venta
class HotCoffeeTab extends StatelessWidget {
  // Función que recibe el precio del café y lo agrega al carrito
  final Function(double) addToCart;

  // Constructor del widget
  HotCoffeeTab({super.key, required this.addToCart});

  // Lista de cafés en venta con sus atributos: [nombre, tienda, precio, color, imagen]
  final List<List<dynamic>> hotCoffeeSale = [
    [
      "Black Coffee",
      "Starbucks",
      "124",
      Colors.brown,
      "assets/images/BlackCoffee.png",
    ],
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
      itemCount: hotCoffeeSale.length, // Número total de cafés a mostrar
      padding: const EdgeInsets.all(
        8.0,
      ), // Espaciado alrededor de la cuadrícula
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Cantidad de columnas en la cuadrícula
        childAspectRatio: 1 / 1.5, // Relación de aspecto de cada elemento
      ),
      itemBuilder: (context, index) {
        return HotCoffeeTile(
          flavor: hotCoffeeSale[index][0], // Nombre del café
          store: hotCoffeeSale[index][1], // Tienda donde se vende
          price: double.parse(
            hotCoffeeSale[index][2],
          ), // Precio convertido a double
          color: hotCoffeeSale[index][3], // Color asociado al café
          imageName: hotCoffeeSale[index][4], // Ruta de la imagen del café
          onTap: () {
            double price =
                double.tryParse(hotCoffeeSale[index][2]) ??
                0; // Convierte el precio y maneja errores
            addToCart(price); // Agrega el café al carrito con su precio
          },
        );
      },
    );
  }
}

// Widget sin estado que representa la tarjeta de un café individual
class HotCoffeeTile extends StatelessWidget {
  final String flavor; // Nombre del café
  final String store; // Nombre de la tienda
  final double price; // Precio del café
  final Color color; // Color de fondo asociado al café
  final String imageName; // Ruta de la imagen del café
  final VoidCallback onTap; // Función que se ejecuta al tocar la tarjeta

  // Constructor de la tarjeta del café
  const HotCoffeeTile({
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
                imageName, // Muestra la imagen del café
                height: 100,
                width: 100,
                fit: BoxFit.cover, // Ajusta la imagen sin distorsionarla
              ),
              const SizedBox(height: 8), // Espaciado entre la imagen y el texto
              Text(
                flavor, // Muestra el nombre del café
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
