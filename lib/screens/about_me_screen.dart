import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Powrót do poprzedniego ekranu
          },
        ),
        title: Text(
          'O mnie',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Gradient Background
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent.shade100, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: [
                // Header Section
                Container(
                  margin: EdgeInsets.only(top: 60),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 15,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: SvgPicture.asset(
                            'lib/assets/icons/woman.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Anna Nowak',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent.shade700,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.grey.shade400,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Organizatorka Ślubów',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // About Me Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'O mnie',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent.shade700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 10),
                      AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: 1.0,
                        child: Text(
                          'Cześć! Jestem Anna Nowak, profesjonalna organizatorka ślubów z ponad 10-letnim doświadczeniem. '
                              'Moim celem jest tworzenie wyjątkowych ceremonii, które pozostają w pamięci na całe życie. '
                              'Pracuję z Parami Młodymi, aby każdy szczegół ich wielkiego dnia był perfekcyjny i zgodny z ich marzeniami.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Moje umiejętności:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent.shade700,
                        ),
                      ),
                      SizedBox(height: 10),

                      // Skills Section with Icons
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildSkillTile(
                              icon: Icons.event, label: 'Planowanie wydarzeń'),
                          _buildSkillTile(
                              icon: Icons.brush, label: 'Dekoracje ślubne'),
                          _buildSkillTile(
                              icon: Icons.attach_money, label: 'Budżetowanie'),
                          _buildSkillTile(
                              icon: Icons.group, label: 'Zarządzanie zespołem'),
                          _buildSkillTile(
                              icon: Icons.lightbulb, label: 'Kreatywność'),
                          _buildSkillTile(
                              icon: Icons.headset_mic, label: 'Obsługa klienta'),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // Call-to-Action Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/contact');
                  },
                  icon: Icon(Icons.mail, color: Colors.white),
                  label: Text('Skontaktuj się ze mną'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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

  // Helper Method for Skill Tiles
  Widget _buildSkillTile({required IconData icon, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.pinkAccent),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
