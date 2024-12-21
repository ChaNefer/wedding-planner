import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  // Funkcja do otwierania URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Nie można otworzyć $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bądźmy w kontakcie',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Text(
                'Skontaktuj się ze mną :)',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80),
              ContactCard(
                icon: Icons.email,
                title: 'E-mail',
                subtitle: 'anna.nowak@example.com',
                onTap: () {
                  _launchURL('mailto:anna.nowak@example.com');
                },
              ),
              SizedBox(height: 12),
              ContactCard(
                icon: Icons.web,
                title: 'Strona internetowa',
                subtitle: 'www.annanowak.com',
                onTap: () {
                  _launchURL('https://www.aleksandraweber.studio');
                },
              ),
              SizedBox(height: 12),
              ContactCard(
                icon: Icons.phone,
                title: 'Numer telefonu',
                subtitle: '+48 123 456 789',
                onTap: () {
                  _launchURL('tel:+48123456789');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        shadowColor: Colors.teal.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.teal.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.teal,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade900,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
