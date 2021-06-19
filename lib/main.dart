import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgets = [];
  int counter = 0;
  @override
  void initState() {
    Widget card = Center(
        child: Card(
      elevation: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text('Click + to add more cards'),
      ),
    ));
    widgets.add(card);
    super.initState();
  }

  add() {
    Widget card = newCard(counter);
    setState(() {
      widgets.add(card);
      counter++;
    });
  }

  newCard(int i) {
    Key key = Key(i.toString());
    Container child = Container(
      key: key,
      padding: EdgeInsets.all(15),
      child: Scrollbar(
        child: Container(
          width: 150,
          height: 90,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 50,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text('This is Card_$counter'),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 25,
                    width: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () => remove(key),
                      child: Icon(Icons.delete_rounded),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
    return child;
  }

  remove(Key key) {
    for (int i = 0; i < widgets.length; i++) {
      Widget child = widgets.elementAt(i);
      if (child.key == key) {
        setState(() {
          widgets.removeAt(i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: widgets,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
