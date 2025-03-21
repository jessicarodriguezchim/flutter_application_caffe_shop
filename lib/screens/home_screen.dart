import "package:flutter/material.dart";
import "package:flutter_application_caffe_shop/tabs/hotCoffe_tab.dart";
import "package:flutter_application_caffe_shop/widgets/home_bottom_bar.dart";
import "package:flutter_application_caffe_shop/widgets/items_widget.dart";

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int itemCount = 0;
  double totalPrice = 0.0;

  void addToCart(double price) {
    setState(() {
      itemCount++;
      totalPrice += price;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar personalizada
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sort_rounded, color: Colors.white, size: 35),
                    Icon(Icons.notifications, color: Colors.white, size: 35),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Título
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It's a Great Day for Coffee",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Barra de búsqueda
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find your coffee",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),

              // Tabs
              TabBar(
                controller: _tabController,
                labelColor: Color(0xFFE57734),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3, color: Color(0xFFE57734)),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(text: "Hot Coffee"),
                  Tab(text: "Cold Coffee"),
                  Tab(text: "Cappuccino"),
                  Tab(text: "Americano"),
                ],
              ),

              SizedBox(height: 10),

              // Contenido de las pestañas
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HotCoffeeTab(addToCart: addToCart),
                    ItemsWidget(),
                    ItemsWidget(),
                    ItemsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
