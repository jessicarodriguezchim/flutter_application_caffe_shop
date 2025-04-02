import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class SingleItemScreen extends StatefulWidget {
  final String img;
  const SingleItemScreen(this.img);

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  int cantidad = 1; // Variable para controlar la cantidad
  double precio = 30.20; // Precio del producto

  // Función para aumentar la cantidad
  void _incrementarCantidad() {
    setState(() {
      cantidad++;
    });
  }

  // Función para disminuir la cantidad
  void _decrementarCantidad() {
    if (cantidad > 1) {
      setState(() {
        cantidad--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/images/${widget.img}.png", // Asegúrate de usar el widget.img
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEST COFFEE",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget
                            .img, // Usando widget.img para mostrar el nombre del producto
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Contenedor de control de cantidad
                            Container(
                              padding: EdgeInsets.all(20),
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Botón de disminución
                                  IconButton(
                                    icon: Icon(
                                      CupertinoIcons.minus,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    onPressed: _decrementarCantidad,
                                  ),
                                  SizedBox(width: 15),
                                  // Mostrar cantidad
                                  Text(
                                    "$cantidad",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  // Botón de incremento
                                  IconButton(
                                    icon: Icon(
                                      CupertinoIcons.plus,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    onPressed: _incrementarCantidad,
                                  ),
                                ],
                              ),
                            ),
                            // Mostrar precio actualizado según la cantidad
                            Flexible(
                              child: Text(
                                "\$ ${(precio * cantidad).toStringAsFixed(2)}", // Formato con 2 decimales
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                                overflow:
                                    TextOverflow
                                        .ellipsis, // Evita que el texto se desborde
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Coffee is a major source of antioxidants in the diet. It has many health benefits.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Volume: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "60 ml",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      // Botones para agregar al carrito o favorito
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Botón de agregar al carrito
                            GestureDetector(
                              onTap: () {
                                // Aquí podrías agregar la lógica para agregar al carrito
                                print("Producto agregado al carrito");
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 50,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 50, 54, 56),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                            // Botón de agregar a favoritos
                            GestureDetector(
                              onTap: () {
                                // Aquí podrías agregar la lógica para agregar a favoritos
                                print("Producto agregado a favoritos");
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE57734),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
