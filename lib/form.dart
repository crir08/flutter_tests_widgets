import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tests/home.dart';

import 'dialogs.dart';
enum Personnage { hulk, thor, ironman }

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int _selectedIndex = 1;
  bool checkBoxVal = false;
  Personnage _personnage = Personnage.hulk;
  double _sliderVal = 0;
  bool switchVal = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2021),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _pickTime(BuildContext context) async {
    TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: selectedTime
    );

    if(t != null) {
      setState(() {
        selectedTime = t;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0 ) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
      );
    } else if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DialogsPage())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulaires',
//          style: TextStyle(color: Colors.black),
        ),
//        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: checkBoxVal,
                onChanged: (bool value) {
                  setState(() {
                    checkBoxVal = value;
                  });
                },
//                activeColor: Theme.of(context).primaryColor,
              ),
              ListTile(
                title: const Text('Hulk'),
                leading: Radio(
                  value: Personnage.hulk,
                  groupValue: _personnage,
                  onChanged: (Personnage value) {
                    setState(() {
                      _personnage = value;
                    });
                  },
//                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                title: const Text('Thor'),
                leading: Radio(
                  value: Personnage.thor,
                  groupValue: _personnage,
                  onChanged: (Personnage value) {
                    setState(() {
                      _personnage = value;
                    });
                  },
//                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                title: const Text('Iron Man'),
                leading: Radio(
                  value: Personnage.ironman,
                  groupValue: _personnage,
                  onChanged: (Personnage value) {
                    setState(() {
                      _personnage = value;
                    });
                  },
//                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
              Slider(
                value: _sliderVal,
                min: 0,
                max: 100,
                divisions: 5,
                label: _sliderVal.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _sliderVal = value;
                  });
                },
//                activeColor: Theme.of(context).primaryColor,
//                inactiveColor: Colors.grey,
              ),
              Switch(
                value: switchVal,
                onChanged: (bool value) {
                  setState(() {
                    switchVal = value;
                  });
                },
//                activeColor: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
//                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Nom d\'utilisateur',
//                    fillColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Text('$selectedDate'),
              SizedBox(height: 16.0),
              RaisedButton(
                child: Text('Sélectionner une date'),
                onPressed: () => _selectDate(context),
              ),
              Text('$selectedTime'),
              SizedBox(height: 16.0),
              RaisedButton(
                child: Text('Sélectionner un moment'),
                onPressed: () => _pickTime(context),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('Formulaires'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('Dialogues, alertes et panneaux'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
