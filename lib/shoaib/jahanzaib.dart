import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DinMuhammad extends StatefulWidget {
  @override
  _DinMuhammadState createState() => _DinMuhammadState();
}

class _DinMuhammadState extends State<DinMuhammad> {
  TextEditingController _nameController = TextEditingController();
  String _storedName = '';

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedName = prefs.getString('name') ?? 'No Name Stored';
    });
  }

  Future<void> _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    setState(() {
      _storedName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stored Name: $_storedName',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveName(_nameController.text);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
