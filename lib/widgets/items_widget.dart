// Importamos los paquetes necesarios para usar widgets de Cupertino y Material.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Importamos únicamente la pantalla "SingleItemScreen" desde el archivo correspondiente.
import 'package:flutter_application_caffe_shop/screens/single_item_screen.dart'
    show SingleItemScreen;

// La anotación "ignore: must_be_immutable" se usa para ignorar la advertencia de que este widget es inmutable,
// pero tiene variables que pueden modificarse (en este caso, la lista "img").
class ItemsWidget extends StatelessWidget {
  // Lista de imágenes o nombres de items. Aquí se definen los nombres que se usarán para mostrar imágenes y textos.
  List img = ['Latte', 'Espresso', 'BlackCoffee', 'ColdCoffee'];

  // Constructor del widget ItemsWidget. Se utiliza super.key para pasar la clave al constructor de la clase padre.
  ItemsWidget({super.key});

  // Método que construye la interfaz del widget.
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Deshabilita el desplazamiento del grid para que no se pueda hacer scroll.
      physics: NeverScrollableScrollPhysics(),
      // Define que se mostrarán 2 elementos por fila.
      crossAxisCount: 2,
      // Permite que el GridView se ajuste al tamaño del contenido.
      shrinkWrap: true,
      // Relación de aspecto de cada hijo del grid (ancho / alto).
      childAspectRatio: (150 / 195),
      // Se crea la lista de widgets que se van a mostrar en el grid.
      children: [
        // Se recorre la lista "img" y para cada elemento se crea un Container.
        for (int i = 0; i < img.length; i++)
          Container(
            // Define un padding interno para el container.
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            // Define un margen alrededor del container.
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            // Configuración visual del container.
            decoration: BoxDecoration(
              // Bordes redondeados con un radio de 20.
              borderRadius: BorderRadius.circular(20),
              // Color de fondo oscuro.
              color: Color(0xFF212325),
              // Sombra alrededor del container.
              boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 8)],
            ),
            // El contenido del container se organiza en una columna.
            child: Column(
              children: [
                // InkWell detecta toques y permite mostrar efectos visuales al pulsar.
                InkWell(
                  // Acción al pulsar: navega a la pantalla SingleItemScreen pasando el nombre de la imagen.
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleItemScreen(img[i]),
                      ),
                    );
                  },
                  // Contenedor que envuelve la imagen.
                  child: Container(
                    // Margen alrededor de la imagen.
                    margin: EdgeInsets.all(10),
                    // Se carga la imagen desde los assets.
                    child: Image.asset(
                      "assets/images/${img[i]}.png", // Se construye la ruta de la imagen según el nombre.
                      width: 120,
                      height: 120,
                      fit:
                          BoxFit
                              .contain, // Ajusta la imagen dentro del contenedor sin recortarla.
                    ),
                  ),
                ),
                // Padding para separar el texto de la imagen.
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  // Alinea el contenido a la izquierda.
                  child: Align(
                    alignment: Alignment.centerLeft,
                    // Columna que contiene el título y la descripción.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Muestra el nombre del item (ej. "Latte", "Espresso").
                        Text(
                          img[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // Espacio entre el título y la descripción.
                        SizedBox(height: 8),
                        // Texto descriptivo adicional.
                        Text(
                          "Best Coffe", // Texto fijo, puede representar una descripción del item.
                          style: TextStyle(fontSize: 16, color: Colors.white60),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding que envuelve la fila inferior (precio y botón).
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  // Fila para organizar el precio y el botón de añadir en extremos opuestos.
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Texto que muestra el precio del item.
                      Text(
                        "\$30",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      // Botón que contiene un ícono para añadir el item.
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          // Fondo de color para el botón.
                          color: Color(0XFFE57734),
                          // Bordes redondeados para el botón.
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // Ícono que representa la acción de añadir.
                        child: Icon(
                          CupertinoIcons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
