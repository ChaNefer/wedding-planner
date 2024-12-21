import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _opacity = 0.0;
  bool isExpanded = false; // Kontroluje rozwinięcie przycisków

  @override
  void initState() {
    super.initState();
    _fadeInImage();
  }

  void _fadeInImage() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EDEB), // Jasny pastelowy róż
      appBar: AppBar(
        title: Text('Organizator Ślubów', style: GoogleFonts.poppins()),
        backgroundColor: Color(0xFFD291BC), // Pastelowy fiolet
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Container(
                  width: 160, // Odpowiada `radius: 80`
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Ustawienie okrągłego kształtu
                    color: Colors.white, // Tło pod SVG (jeśli potrzebne)
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      'lib/assets/icons/woman.svg', // Ścieżka do pliku SVG
                      fit: BoxFit.cover, // Dopasowanie SVG do rozmiaru
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Cześć, jestem Anna!',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6D6875), // Elegancki odcień szarości
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Organizuję wyjątkowe śluby, dbając o każdy szczegół.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFFB5838D), // Jasny różowy
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  // Row dla pierwszych dwóch przycisków
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Ustawienie przycisków na środku
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/about');
                        },
                        icon: Icon(Icons.person, color: Colors.white),
                        label: Text('O mnie', style: GoogleFonts.poppins(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD291BC), // Pastelowy fiolet
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Odstęp między pierwszym i drugim przyciskiem
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/experience_screen');
                        },
                        icon: Icon(Icons.photo_album, color: Colors.white),
                        label: Text('Moje doświadczenie', style: GoogleFonts.poppins(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD291BC), // Pastelowy fiolet
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Jeśli isExpanded, dodajemy trzeci i czwarty przycisk
                  if (isExpanded) ...[
                    SizedBox(height: 20), // Odstęp przed trzecim przyciskiem
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/contact');
                      },
                      icon: Icon(Icons.contact_mail, color: Colors.white),
                      label: Text('Kontakt', style: GoogleFonts.poppins(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD291BC), // Pastelowy fiolet
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Odstęp przed czwartym przyciskiem
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/timeline');
                      },
                      icon: Icon(Icons.visibility, color: Colors.white),
                      label: Text('Jak to wygląda w praktyce?', style: GoogleFonts.poppins(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD291BC), // Pastelowy fiolet
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],

                  // Przycisk rozwinięcia
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded; // Zmienia stan rozwinięcia
                      });
                    },
                    child: Text(isExpanded ? 'Mniej' : 'Więcej'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD291BC),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}