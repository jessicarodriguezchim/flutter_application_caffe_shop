import "package:flutter/material.dart";

class EspressoTab extends StatelessWidget {
  final Function(double) addToCart;

  EspressoTab({super.key, required this.addToCart});

  // Lista de espressos en venta
  final List<List<dynamic>> espressoSale = [
    // [Sabor, Tienda, Precio, Color, Imagen]
    ["Espresso", "Starbucks", "90", Colors.brown, "assets/images/Espresso.png"],
    [
      "Double Espresso",
      "Dunkin",
      "120",
      Colors.deepOrange,
      "assets/images/DoubleEspresso.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: espressoSale.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return EspressoTile(
          flavor: espressoSale[index][0],
          store: espressoSale[index][1],
          price: double.parse(espressoSale[index][2]),
          color: espressoSale[index][3],
          imageName: espressoSale[index][4],
          onTap: () {
            double price = double.tryParse(espressoSale[index][2]) ?? 0;
            addToCart(price);
          },
        );
      },
    );
  }
}

class EspressoTile extends StatelessWidget {
  final String flavor;
  final String store;
  final double price;
  final Color color;
  final String imageName;
  final VoidCallback onTap;

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
