import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'home.dart';
import 'form.dart';

class DialogsPage extends StatefulWidget {
  @override
  _DialogsPageState createState() => _DialogsPageState();
}

class _DialogsPageState extends State<DialogsPage> {
  int _selectedIndex = 2;
  bool _afficherBanniere = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
      );
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FormPage())
      );
    }
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Titre de l\'alerte'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Ceci est une démonstration d\'alerte.'),
                Text('Voulez-vous approuver ce message ?'),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text('Approuver'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext _context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Musique'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Vidéos'),
                onTap: () => {},
              ),
            ],
          ),
        );
      }
    );
  }

  Future<void> _showSimpleDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choisissez un héros'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Iron Man'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Capitaine America'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    final snackbar = SnackBar(
      content: Text('Voici une SnackBar!'),
    );
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Voici une SnackBar!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dialogues, alertes et panneaux',
//          style: TextStyle(color: Colors.black),
        ),
//        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Builder(
        builder: (context) {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_afficherBanniere)
                    MaterialBanner(
                      content: Text('Ceci est une bannière.'),
                      actions: [
                        FlatButton(
                          child: Text('FERMER'),
                          onPressed: () {
                            setState(() {
                              _afficherBanniere = false;
                            });
                          },
                        ),
                      ],
                    ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _showAlertDialog();
                      },
                      child: Text('AlertDialog'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _showSimpleDialog();
                      },
                      child: Text('SimpleDialog'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      child: Text('BottomSheet'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _showSnackBar(context);
                      },
                      child: Text('SnackBar'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _afficherBanniere = true;
                        });
                      },
                      child: Text('Banniere'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
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
