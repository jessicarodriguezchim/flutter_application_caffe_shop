import 'package:flutter/material.dart';
import 'package:flutter_application_caffe_shop/screens/home_screen.dart'
    show HomeScreen;
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 100),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            opacity: 0.6,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Coffee Shop",
                style: GoogleFonts.pacifico(fontSize: 50, color: Colors.white),
              ),
            ),
            Column(
              children: [
                Text(
                  "Feeling Low? Take a sip of Coffee",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 80),
                Material(
                  color: Color(0xFFE57734),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                      decoration: BoxDecoration(),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
