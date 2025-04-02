import 'package:flutter/material.dart';

// Widget sin estado que representa una pestaña de lattes.
class LatteTab extends StatelessWidget {
  // Función que se ejecutará al agregar un latte al carrito.
  final Function(double) addToCart;

  // Constructor que recibe la función addToCart como parámetro requerido.
  LatteTab({super.key, required this.addToCart});

  // Lista de lattes en venta. Cada latte es una lista con:
  // [Sabor, Tienda, Precio, Color, Ruta de la imagen]
  final List<List<dynamic>> latteSale = [
    [
      "Vanilla Latte",
      "Starbucks",
      "150",
      Colors.brown,
      "assets/images/VanillaLatte.png",
    ],
    [
      "Caramel Latte",
      "Dunkin",
      "160",
      Colors.amber,
      "assets/images/CaramelLatte.png",
    ],
    [
      "Hazelnut Latte",
      "Costa Coffee",
      "170",
      Colors.orangeAccent,
      "assets/images/HazelnutLatte.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Número de elementos en la cuadrícula basado en la longitud de latteSale.
      itemCount: latteSale.length,
      // Espaciado alrededor de la cuadrícula.
      padding: const EdgeInsets.all(8.0),
      // Delegado que define el diseño de la cuadrícula.
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Número de columnas en la cuadrícula.
        childAspectRatio: 1 / 1.5, // Relación de aspecto de cada celda.
      ),
      // Constructor de cada elemento de la cuadrícula.
      itemBuilder: (context, index) {
        return LatteTile(
          flavor: latteSale[index][0], // Sabor del latte.
          store: latteSale[index][1], // Tienda que vende el latte.
          price: double.parse(latteSale[index][2]), // Precio del latte.
          color: latteSale[index][3], // Color asociado al latte.
          imageName: latteSale[index][4], // Ruta de la imagen del latte.
          onTap: () {
            // Convierte el precio a double y lo pasa a la función addToCart.
            double price = double.tryParse(latteSale[index][2]) ?? 0;
            addToCart(price);
          },
        );
      },
    );
  }
}

// Widget sin estado que representa una tarjeta individual de latte.
class LatteTile extends StatelessWidget {
  final String flavor; // Sabor del latte.
  final String store; // Tienda que vende el latte.
  final double price; // Precio del latte.
  final Color color; // Color asociado al latte.
  final String imageName; // Ruta de la imagen del latte.
  final VoidCallback onTap; // Función que se ejecuta al tocar la tarjeta.

  // Constructor que inicializa todas las propiedades requeridas.
  const LatteTile({
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
      onTap: onTap, // Asigna la función onTap al detector de gestos.
      child: Card(
        color: color.withOpacity(
          0.2,
        ), // Color de fondo de la tarjeta con opacidad.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados.
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ), // Espaciado interno de la tarjeta.
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos verticalmente.
            children: [
              Image.asset(
                imageName, // Muestra la imagen del latte.
                height: 100,
                width: 100,
                fit:
                    BoxFit
                        .cover, // Ajusta la imagen para cubrir el espacio disponible.
              ),
              const SizedBox(
                height: 8,
              ), // Espaciado entre la imagen y el texto.
              Text(
                flavor, // Muestra el sabor del latte.
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                store, // Muestra la tienda que vende el latte.
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                '\$$price', // Muestra el precio del latte.
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
