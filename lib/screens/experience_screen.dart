import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doświadczenie'),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildTimelineTile(
            context,
            year: '2019',
            title: 'Organizacja ślubu w stylu rustykalnym',
            description:
            'Zrealizowałam ślub w plenerze z dekoracjami z naturalnych materiałów. Oprócz klasycznych ozdób, wykorzystaliśmy m.in. drewniane tablice, kwiaty polne oraz oświetlenie w stylu vintage. Ślub odbył się w malowniczym ogrodzie, który doskonale oddał klimat rustykalnej elegancji. Ciekawostka: W stylu rustykalnym dominują naturalne, surowe materiały – drewno, len, jutę.',
            imageUrl: 'assets/rustykalny_wedding.jpg',
            icon: Icons.nature_people,
            color: Colors.green.shade400,
          ),
          _buildTimelineTile(
            context,
            year: '2020',
            title: 'Ślub glamour',
            description:
            'Przygotowałam wesele w stylu glamour z kryształowymi dekoracjami, które błyszczały w świetle żyrandoli. Użyliśmy eleganckich materiałów, takich jak satyna i jedwab, a dodatkowo zaprosiliśmy artystów wykonujących akrobatyczne pokazy. Ciekawostka: Styl glamour to synonim luksusu – kryształowe dodatki, elegancka biżuteria i perfekcyjna oprawa świetlna.',
            imageUrl: 'lib/assets/images/glamour-wedding.jpg',
            icon: Icons.star,
            color: Colors.pink.shade300,
          ),
          _buildTimelineTile(
            context,
            year: '2021',
            title: 'Ślub boho na plaży',
            description:
            'Zorganizowałam ślub w stylu boho na plaży, gdzie dominowały lekkie, naturalne dekoracje, takie jak zwiewne firany, koronkowe elementy oraz drewniane stoły. Idealnym dopełnieniem była muzyka na żywo przy blasku zachodzącego słońca. Ciekawostka: Styl boho to połączenie wolności, natury i swobody – jest to idealna opcja na ślub w plenerze.',
            imageUrl: 'assets/boho_wedding_beach.jpg',
            icon: Icons.beach_access,
            color: Colors.blue.shade300,
          ),
          _buildTimelineTile(
            context,
            year: '2022',
            title: 'Ślub w stylu industrialnym',
            description:
            'Wesele w przestrzeni pofabrycznej, gdzie dominowały surowe betonowe ściany, metalowe akcenty i nowoczesne elementy wystroju. Zamiast tradycyjnych kwiatów, użyliśmy metalowych donic z roślinami oraz industrialnych lamp. Ciekawostka: Styl industrialny jest inspirowany przestrzeniami przemysłowymi – cegła, metal i beton są jego głównymi elementami.',
            imageUrl: 'assets/industrial_wedding.jpg',
            icon: Icons.factory,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineTile(
      BuildContext context, {
        required String year,
        required String title,
        required String description,
        required String imageUrl,
        required IconData icon,
        required Color color,
      }) {
    return GestureDetector(
      onTap: () {
        // Efekt przejścia na nowy ekran z detalami ślubu
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => DetailsScreen(
              year: year,
              title: title,
              description: description,
              imageUrl: imageUrl,
              color: color,
            ),
            transitionsBuilder: (_, animation, __, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset(0, 0),
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ikona z animowanym cieniem
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(top: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            SizedBox(width: 16),
            // Szczegóły ślubu
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Image.asset(imageUrl, fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nowy ekran dla szczegółów ślubu
class DetailsScreen extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final String imageUrl;
  final Color color;

  DetailsScreen({
    required this.year,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              year,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 16),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Image.asset(imageUrl, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
