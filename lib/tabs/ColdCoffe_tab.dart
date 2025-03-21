import "package:flutter/material.dart";

class ColdCoffeeTab extends StatelessWidget {
  final Function(double) addToCart;

  ColdCoffeeTab({super.key, required this.addToCart});

  // Lista de cafés fríos en venta
  final List<List<dynamic>> coldCoffeeSale = [
    // [Sabor, Tienda, Precio, Color, Imagen]
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
      itemCount: coldCoffeeSale.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return ColdCoffeeTile(
          flavor: coldCoffeeSale[index][0],
          store: coldCoffeeSale[index][1],
          price: double.parse(coldCoffeeSale[index][2]),
          color: coldCoffeeSale[index][3],
          imageName: coldCoffeeSale[index][4],
          onTap: () {
            double price = double.tryParse(coldCoffeeSale[index][2]) ?? 0;
            addToCart(price);
          },
        );
      },
    );
  }
}

class ColdCoffeeTile extends StatelessWidget {
  final String flavor;
  final String store;
  final double price;
  final Color color;
  final String imageName;
  final VoidCallback onTap;

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
