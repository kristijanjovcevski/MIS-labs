import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ClothingItem {
  String name;

  ClothingItem(this.name);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage()

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

}

class _MyHomePageState extends State<MyHomePage> {
  List<ClothingItem> clothesList = [];
  TextEditingController _textFieldController = TextEditingController();
  int selectedIndex = -1;



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'Clothes List',
          style: TextStyle(color: Colors.blue)
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: clothesList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(clothesList[index].name),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            _showEditDialog();


                          });
                        },
                      ),
                    ),
                    _customButton('Edit', Colors.green, Colors.red, () {
                      setState(() {
                        selectedIndex = index;
                        _showEditDialog();


                      });
                    }),
                    _customButton('Delete', Colors.green, Colors.red, () {
                      _showDeleteConfirmationDialog(index);

                    }),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _customButton('Add', Colors.green, Colors.red, _showAddDialog),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _customButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: bgColor,
        ),
        child: Text(text),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Clothes', style: TextStyle(color: Colors.blue)),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Enter clothes name'),
          ),
          actions: [
            _customButton('Cancel', Colors.green, Colors.red, () {
              Navigator.of(context).pop();
            }),
            _customButton('Add', Colors.green, Colors.red, () {
              setState(() {
                clothesList.add(ClothingItem(_textFieldController.text));
              });
              _textFieldController.clear();
              Navigator.of(context).pop();
            }),
          ],
        );
      },
    );
  }


  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Confirmation', style: TextStyle(color: Colors.blue)),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            _customButton('Cancel', Colors.green, Colors.red, () {
              Navigator.of(context).pop();
            }),
            _customButton('Delete', Colors.green, Colors.red, () {
              _deleteItem(index);
              Navigator.of(context).pop(); // Close the confirmation dialog
            }),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    if (index >= 0 && index < clothesList.length) {
      setState(() {
        clothesList.removeAt(index);
        selectedIndex = -1;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid index for deletion.'),
        ),
      );
    }
  }

  void _showEditDialog() {
    if (selectedIndex >= 0 && selectedIndex < clothesList.length) {
      _textFieldController.text = clothesList[selectedIndex].name;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Edit Clothes', style: TextStyle(color: Colors.blue)),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: 'Enter new name'),
            ),
            actions: [
              _customButton('Cancel', Colors.green, Colors.red, () {
                Navigator.of(context).pop();
              }),
              _customButton('Save', Colors.green, Colors.red, () {
                setState(() {
                  clothesList[selectedIndex].name = _textFieldController.text;
                });
                _textFieldController.clear();
                Navigator.of(context).pop();
              }),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an item to edit.'),
        ),
      );
    }
  }

}
