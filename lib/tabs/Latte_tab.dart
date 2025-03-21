import "package:flutter/material.dart";

class LatteTab extends StatelessWidget {
  final Function(double) addToCart;

  LatteTab({super.key, required this.addToCart});

  // Lista de lattes en venta
  final List<List<dynamic>> latteSale = [
    // [Sabor, Tienda, Precio, Color, Imagen]
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
      itemCount: latteSale.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return LatteTile(
          flavor: latteSale[index][0],
          store: latteSale[index][1],
          price: double.parse(latteSale[index][2]),
          color: latteSale[index][3],
          imageName: latteSale[index][4],
          onTap: () {
            double price = double.tryParse(latteSale[index][2]) ?? 0;
            addToCart(price);
          },
        );
      },
    );
  }
}

class LatteTile extends StatelessWidget {
  final String flavor;
  final String store;
  final double price;
  final Color color;
  final String imageName;
  final VoidCallback onTap;

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
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageName,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                flavor,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                store,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                '\$$price',
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
