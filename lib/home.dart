import 'package:flutter/material.dart';
import 'package:tests/dialogs.dart';

import 'form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FormPage()));
    } else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DialogsPage()));
    }
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
//              color: Theme.of(context).accentColor,
                ),
            child: Text(
              'DRAWER',
//              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profil'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accueil',
        ),
      ),
      drawer: _buildDrawer(),
      body: ListView(
        children: [
          LinearProgressIndicator(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PopupMenuButton(
                onSelected: (result) {
                  setState(() {});
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text('Item 1'),
                  ),
                  PopupMenuItem(
                    child: Text('Item 2'),
                  ),
                  PopupMenuItem(
                    child: Text('Item 3'),
                  )
                ],
              ),
              Center(
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.album),
                        title: Text('El Camino'),
                        subtitle: Text('Album by The Black Keys'),
                      ),
                      ButtonBar(
                        children: [
                          FlatButton(
                            child: Text('ANNULER'),
                            onPressed: () => {},
                          ),
                          RaisedButton(
                            child: Text('ÉCOUTER'),
                            onPressed: () => {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Chip(
                avatar: CircleAvatar(
                  child: Text('LB'),
                ),
                label: Text('Léo Blier'),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              Container(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text("Mauve"),
                        color: Colors.purple,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Rose'),
                        color: Colors.pink,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Rouge'),
                        color: Colors.red,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Orange'),
                        color: Colors.orange,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Jaune'),
                        color: Colors.yellow,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Vert'),
                        color: Colors.green,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text('Bleu'),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 0,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
