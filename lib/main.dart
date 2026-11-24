import 'package:flutter/material.dart';

void main() {
  runApp(const MonApp());
}

class MonApp extends StatelessWidget {
  const MonApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV Lubuto Djuma Ange',
      theme: ThemeData(
        primaryColor: const Color(0xFF0D47A1),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1),
          foregroundColor: Colors.white,
        ),
      ),
      home: const PageConnexion(),
    );
  }
}

// ============ PAGE 1 : CONNEXION - BLEU / NOIR ============
class PageConnexion extends StatefulWidget {
  const PageConnexion({super.key});
  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  final _identifiantController = TextEditingController();
  final _mdpController = TextEditingController();

  void _seConnecter() {
    if (_identifiantController.text.isNotEmpty &&
        _mdpController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PagePrincipale()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Remplis identifiant et mot de passe')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0D47A1),
                    shape: BoxShape.circle,
                  ),
                  child: const Text('A', style: TextStyle(fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                const Text('Bienvenue', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                const Text('Lubuto Djuma Ange', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 24),
                TextField(
                  controller: _identifiantController,
                  decoration: InputDecoration(
                    labelText: 'Identifiant',
                    prefixIcon: const Icon(Icons.person, color: Color(0xFF0D47A1)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _mdpController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF0D47A1)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D47A1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _seConnecter,
                    child: const Text('Se connecter', style: TextStyle(fontSize: 18, color: Colors.white)),
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

// ============ NAVIGATION ============
class PagePrincipale extends StatefulWidget {
  const PagePrincipale({super.key});
  @override
  State<PagePrincipale> createState() => _PagePrincipaleState();
}

class _PagePrincipaleState extends State<PagePrincipale> {
  int _index = 0;
  final _pages = const [PageCV(), PageFamille(), PageContact()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lubuto Djuma Ange'), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D47A1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Text('A', style: TextStyle(fontSize: 28, color: Color(0xFF0D47A1), fontWeight: FontWeight.bold))),
                  SizedBox(height: 10),
                  Text('Lubuto Djuma Ange', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Étudiante à ISIG Goma', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(leading: const Icon(Icons.person, color: Color(0xFF0D47A1)), title: const Text('Mon CV'), onTap: () { setState(() => _index = 0); Navigator.pop(context); }),
            ListTile(leading: const Icon(Icons.family_restroom, color: Color(0xFF0D47A1)), title: const Text('Ma Famille'), onTap: () { setState(() => _index = 1); Navigator.pop(context); }),
            ListTile(leading: const Icon(Icons.contact_phone, color: Color(0xFF0D47A1)), title: const Text('Contact'), onTap: () { setState(() => _index = 2); Navigator.pop(context); }),
          ],
        ),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: const Color(0xFF0D47A1),
        unselectedItemColor: Colors.black54,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'CV'),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Famille'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: 'Contact'),
        ],
      ),
    );
  }
}

// ============ PAGE 2 : CV ============
class PageCV extends StatelessWidget {
  const PageCV({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF0D47A1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
  CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/image/moi.jpg')),
                SizedBox(height: 12),
                Text('Lubuto Djuma Ange', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Étudiante à ISIG Goma', style: TextStyle(color: Colors.white70, fontSize: 16)),
                SizedBox(height: 6),
                Text('Née le 19 décembre 2004 à Goma', style: TextStyle(color: Colors.white, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _titre('🎓  Formation'),
          _carte('ISIG Goma', 'Institut Supérieur d’Informatique et de Gestion - En cours'),
          _carte('Diplôme d’État', 'Goma, RDC'),
          const SizedBox(height: 16),
          _titre('💼  Expériences / Projets'),
          _carte('Projet CV Flutter', 'Application mobile : CV, Famille, Contact avec connexion'),
          _carte('Gestion d’entreprise', 'Bureautique, base de données, gestion'),
          const SizedBox(height: 16),
          _titre('🛠️  Compétences'),
           Wrap(spacing: 8, runSpacing: 8, children: [
            _chip('JavaScript'), _chip('HTML'), _chip('C#'), _chip('Base de données'),
            _chip('Excel'), _chip('Word'), _chip('Bureautique'), _chip('Gestion d’entreprise'),
          ]),
          const SizedBox(height: 16),
          _titre('🌍  Langues'),
          _carte('Français - Courant', 'Anglais - Bon niveau • Swahili - Langue maternelle'),
          const SizedBox(height: 16),
          _titre('❤️  Centres d’intérêt'),
          _carte('Passions', 'Programmation, Musique, Lecture, Famille'),
        ],
      ),
    ),
    );      
  }

  static Widget _titre(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(t, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black)),
  );
  static Widget _carte(String titre, String sous) => Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: const CircleAvatar(backgroundColor: Color(0xFF0D47A1), child: Icon(Icons.check, color: Colors.white, size: 18)),
      title: Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(sous),
    ),
    );
  static Widget _chip(String t) => Chip(
    label: Text(t, style: const TextStyle(color: Colors.white)),
    backgroundColor: const Color(0xFF1565C0),
  );
}

// ============ PAGE 3 : FAMILLE ============
class PageFamille extends StatelessWidget {
  const PageFamille({super.key});
  @override
  Widget build(BuildContext context) {
    final famille = [
  {'nom': 'Amani Prince', 'lien': 'Père', 'profession': 'Père de famille', 'photo': 'assets/image/papa.jpg'},
  {'nom': 'Raziah Katendele', 'lien': 'Mère', 'profession': 'Mère de famille', 'photo': 'assets/image/maman.jpg'},
  {'nom': 'Jordan Djuma', 'lien': 'Petit frère', 'profession': 'Frère', 'photo': 'assets/image/jordan.jpg'},
  {'nom': 'Aurore Amani', 'lien': 'Sœur', 'profession': 'Sœur', 'photo': 'assets/image/aurore.jpg'},
];
  
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: famille.length,
      itemBuilder: (context, i) {
        final m = famille[i];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListTile(
           leading: CircleAvatar(radius: 28, backgroundImage: AssetImage(m['photo']!)),
            title: Text(m['nom']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            subtitle: Text('${m['lien']} - ${m['profession']}'),
            trailing: const Icon(Icons.family_restroom, color: Color(0xFF0D47A1)),
          ),
        );
      },
    );
  }
}

// ============ PAGE 4 : CONTACT ============
class PageContact extends StatelessWidget {
  const PageContact({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _contact(Icons.phone, 'Téléphone', '0996575980', const Color(0xFF0D47A1)),
        _contact(Icons.email, 'E-mail', 'lubutoange@gmail.com', Colors.black),
        _contact(Icons.location_on, 'Adresse', 'Quartier Himbi, Avenue Baraka N°256, Goma', const Color(0xFF0D47A1)),
        _contact(Icons.code, 'GitHub', 'github.com/Ange202520', Colors.black),
        _contact(Icons.facebook, 'Facebook', 'Ange Djuma', const Color(0xFF0D47A1)),
        _contact(Icons.music_note, 'TikTok', '@blandine.dj', Colors.black),
      ],
    );
  }
  static Widget _contact(IconData icone, String titre, String valeur, Color couleur) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: couleur, child: Icon(icone, color: Colors.white, size: 20)),
        title: Text(titre, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(valeur),
      ),
    );
  }
}