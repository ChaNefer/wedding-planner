import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  final List<Map<String, String>> timelineEvents = [
    {
      'title': 'Spotkanie z konsultantem',
      'description':
      'Zaczynamy naszą wspólną podróż! Podczas pierwszego spotkania z konsultantem ślubnym zgłębimy Twoje marzenia, oczekiwania i pomogę Ci zaplanować każdy, nawet najmniejszy szczegół. To moment, w którym Twoje plany stają się rzeczywistością.'
    },
    {
      'title': 'Wybór lokacji',
      'description':
      'Marzysz o romantycznym ślubie w malowniczej scenerii? A może wolisz elegancką salę z widokiem na miasto? Wybór odpowiedniego miejsca to kluczowy etap, który nada Twojemu ślubowi niepowtarzalny charakter. Pomogę Ci znaleźć idealną lokalizację, która odzwierciedli Twoje marzenia.'
    },
    {
      'title': 'Próbne menu',
      'description':
      'Podczas próbnego menu nie chodzi tylko o wybór dań – to doświadczenie pełne smaków, które przeniosą Cię w kulinarną podróż. Razem z kucharzem stworzymy idealne menu, które zachwyci Ciebie i Twoich gości. Czas na degustację, która zadowoli każde podniebienie!'
    },
    {
      'title': 'Dzień ślubu',
      'description':
      'W końcu nadszedł ten wyjątkowy dzień! To czas, w którym wszystkie Twoje marzenia o idealnym ślubie stają się rzeczywistością. Każdy moment, od przygotowań po ostatni taniec, będzie zaplanowany w najmniejszych szczegółach. Ja, jako Twój przewodnik, zadbam o to, by dzień ślubu przebiegł bez stresu i w atmosferze pełnej miłości.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Przygotowania czas zacząć...', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink.shade800, // Zmiana koloru tła nagłówka
      ),
      // Dodanie tła dla całego ciała ekranu
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white], // Gradient odcieni szarości i bieli
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: timelineEvents.length,
          itemBuilder: (context, index) {
            final event = timelineEvents[index];
            return TimelineTile(
              title: event['title']!,
              description: event['description']!,
            );
          },
        ),
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final String title;
  final String description;

  TimelineTile({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tytuł z większą czcionką, pogrubieniem i nowym kolorem
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.indigo[900], // Użycie koloru granatowego
                ),
              ),
              SizedBox(height: 12),
              // Opis z większym odstępem, kursywą i subtelnym stylem
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16),
              // Ikona w tle z nowym kolorem
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.event_available,
                  color: Colors.pinkAccent, // Zmiana koloru ikony
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
