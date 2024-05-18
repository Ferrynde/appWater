import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  final TextEditingController desiredWaterController = TextEditingController();
  final TextEditingController consumedWaterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application de consommation d\'eau'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Ajoutez ici la logique de notification
            },
          )
        ],
        backgroundColor: Colors.lightBlue[200],
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'Bienvenue sur notre application, ici nous allons vous aider à gérer votre consommation d\'eau',
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: desiredWaterController,
              decoration: InputDecoration(
                labelText: 'Quantité d\'eau à boire par jour (minimum 2L)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: consumedWaterController,
              decoration: InputDecoration(
                labelText: 'Quantité d\'eau bu aujourd\'hui',
              ),
              keyboardType: TextInputType.number,
            ),
            RaisedButton(
              child: Text('OK'),
              onPressed: () {
                final desiredWater = double.parse(desiredWaterController.text);
                final consumedWater = double.parse(consumedWaterController.text);
                final remainingWater = desiredWater - consumedWater;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Il vous reste $remainingWater L à boire aujourd\'hui.'),
                    );
                  },
                );
              },
            ),
            RaisedButton(
              child: Text('Consulter les conseils'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdvicePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdvicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conseils sur l\'hydratation'),
        backgroundColor: Colors.lightBlue[200],
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'Les bienfaits de boire de l\'eau',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '1. L\'eau aide à maintenir l\'équilibre des fluides corporels.\n'
                  '2. L\'eau peut aider à contrôler les calories.\n'
                  '3. L\'eau aide à énergiser les muscles.\n'
                  '4. L\'eau aide à garder la peau belle.\n'
                  '5. L\'eau aide les reins à fonctionner.\n'
                  '6. L\'eau aide à maintenir une fonction intestinale normale.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
