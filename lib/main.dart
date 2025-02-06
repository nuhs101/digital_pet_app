import 'package:flutter/material.dart';

void main() {
  runApp(DigitalPetApp());
}

class DigitalPetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Pet App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PetTabs(),
    );
  }
}

class PetTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Digital Pet App'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Dachshund'),
              Tab(text: 'Tuxedo Cat'),
              Tab(text: 'Husky'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PetScreen(petName: 'Dachshund'),
            PetScreen(petName: 'Tuxedo Cat'),
            PetScreen(petName: 'Husky'),
          ],
        ),
      ),
    );
  }
}

class PetScreen extends StatefulWidget {
  final String petName;

  PetScreen({required this.petName});

  @override
  _PetScreenState createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  int _hunger = 50;
  int _happiness = 50;

  void _feedPet() {
    setState(() {
      _hunger -= 10;
      if (_hunger < 0) _hunger = 0;
    });
  }

  void _playWithPet() {
    setState(() {
      _happiness += 10;
      if (_happiness > 100) _happiness = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.petName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('Hunger: $_hunger', style: TextStyle(fontSize: 18)),
          LinearProgressIndicator(
            value: _hunger / 100,
            color: Colors.red,
            backgroundColor: Colors.red[100],
          ),
          SizedBox(height: 20),
          Text('Happiness: $_happiness', style: TextStyle(fontSize: 18)),
          LinearProgressIndicator(
            value: _happiness / 100,
            color: Colors.blue,
            backgroundColor: Colors.blue[100],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _feedPet,
                child: Text('Feed'),
              ),
              ElevatedButton(
                onPressed: _playWithPet,
                child: Text('Play'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
