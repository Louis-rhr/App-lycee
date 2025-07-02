import 'package:flutter/material.dart';

void main() {
  runApp(LyceeApp());
}

class LyceeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Révisions Lycée',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Révisions Lycée')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Choisis une matière', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExercicesPage(matiere: 'Maths')));
              },
              icon: Icon(Icons.calculate),
              label: Text('Mathématiques'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExercicesPage(matiere: 'Physique')));
              },
              icon: Icon(Icons.science),
              label: Text('Physique-Chimie'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExercicesPage extends StatelessWidget {
  final String matiere;

  ExercicesPage({required this.matiere});

  final List<Map<String, String>> exos = [
    {
      'titre': 'Dérivée',
      'question': 'Soit f(x) = 3x² + 2x - 1. Calculer f\'(x).',
      'correction': 'f\'(x) = 6x + 2',
    },
    {
      'titre': 'Loi d\'Ohm',
      'question': 'U = 12 V, R = 4 Ω. Calculer I.',
      'correction': 'I = U / R = 3 A',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercices de $matiere')),
      body: ListView.builder(
        itemCount: exos.length,
        itemBuilder: (context, index) {
          final exo = exos[index];
          return Card(
            margin: EdgeInsets.all(12),
            elevation: 3,
            child: ExpansionTile(
              title: Text(exo['titre']!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Énoncé : ${exo['question']}'),
                      SizedBox(height: 10),
                      Text('Correction : ${exo['correction']}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
