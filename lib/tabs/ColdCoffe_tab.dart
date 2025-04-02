import "package:flutter/material.dart"; // Importa la librería principal de Flutter

// Widget sin estado que representa la pestaña de cafés fríos en venta
class ColdCoffeeTab extends StatelessWidget {
  // Función que recibe el precio del café frío y lo agrega al carrito
  final Function(double) addToCart;

  // Constructor del widget
  ColdCoffeeTab({super.key, required this.addToCart});

  // Lista de cafés fríos en venta con sus atributos: [nombre, tienda, precio, color, imagen]
  final List<List<dynamic>> coldCoffeeSale = [
    [
      "Iced Latte",
      "Starbucks",
      "135",
      Colors.lightBlue,
      "assets/images/IcedLatte.png",
    ],
    [
      "Cold Brew",
      "Dunkin",
      "110",
      Colors.blueGrey,
      "assets/images/ColdBrew.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: coldCoffeeSale.length, // Número total de cafés fríos a mostrar
      padding: const EdgeInsets.all(
        8.0,
      ), // Espaciado alrededor de la cuadrícula
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Cantidad de columnas en la cuadrícula
        childAspectRatio: 1 / 1.5, // Relación de aspecto de cada elemento
      ),
      itemBuilder: (context, index) {
        return ColdCoffeeTile(
          flavor: coldCoffeeSale[index][0], // Nombre del café frío
          store: coldCoffeeSale[index][1], // Tienda donde se vende
          price: double.parse(
            coldCoffeeSale[index][2],
          ), // Precio convertido a double
          color: coldCoffeeSale[index][3], // Color asociado al café frío
          imageName:
              coldCoffeeSale[index][4], // Ruta de la imagen del café frío
          onTap: () {
            double price =
                double.tryParse(coldCoffeeSale[index][2]) ??
                0; // Convierte el precio y maneja errores
            addToCart(price); // Agrega el café frío al carrito con su precio
          },
        );
      },
    );
  }
}

// Widget sin estado que representa la tarjeta de un café frío individual
class ColdCoffeeTile extends StatelessWidget {
  final String flavor; // Nombre del café frío
  final String store; // Nombre de la tienda
  final double price; // Precio del café frío
  final Color color; // Color de fondo asociado al café frío
  final String imageName; // Ruta de la imagen del café frío
  final VoidCallback onTap; // Función que se ejecuta al tocar la tarjeta

  // Constructor de la tarjeta del café frío
  const ColdCoffeeTile({
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
                imageName, // Muestra la imagen del café frío
                height: 100,
                width: 100,
                fit: BoxFit.cover, // Ajusta la imagen sin distorsionarla
              ),
              const SizedBox(height: 8), // Espaciado entre la imagen y el texto
              Text(
                flavor, // Muestra el nombre del café frío
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
