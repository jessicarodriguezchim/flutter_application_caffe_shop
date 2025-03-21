import "package:flutter/material.dart";

class HotCoffeeTab extends StatelessWidget {
  final Function(double) addToCart;

  HotCoffeeTab({super.key, required this.addToCart});

  // Lista de cafés en venta
  final List<List<dynamic>> hotCoffeeSale = [
    // [Sabor, Tienda, Precio, Color, Imagen]
    [
      "Black Coffee",
      "Starbucks",
      "124",
      Colors.brown,
      "assets/images/BlackCoffee.png",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: hotCoffeeSale.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return HotCoffeeTile(
          flavor: hotCoffeeSale[index][0],
          store: hotCoffeeSale[index][1],
          price: double.parse(hotCoffeeSale[index][2]),
          color: hotCoffeeSale[index][3],
          imageName: hotCoffeeSale[index][4],
          onTap: () {
            double price = double.tryParse(hotCoffeeSale[index][2]) ?? 0;
            addToCart(price);
          },
        );
      },
    );
  }
}

class HotCoffeeTile extends StatelessWidget {
  final String flavor;
  final String store;
  final double price;
  final Color color;
  final String imageName;
  final VoidCallback onTap;

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
