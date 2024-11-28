import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightControl = TextEditingController();

  TextEditingController _weightControl = TextEditingController();

  double _calculated = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Height - Weight Index Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Your Height/Weight index is ${_calculated.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _heightControl,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                label: Text("Height"),
                hintText: "Example : 1.75",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                suffixText: "m",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _weightControl,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: InputDecoration(
                label: Text("Weight"),
                hintText: "Example : 75",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                suffixText: "kg",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: Text(
                "Calculate The Index",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  elevation: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    String heightText = _heightControl.text.trim();
    String weightText = _weightControl.text.trim();

    try {
      double height = double.parse(heightText);
      double weight = double.parse(weightText);

      setState(() {
        _calculated = weight / (height * height);
      });
    } catch (e) {
      print("An error occurred : ${e.toString()}");
    }
  }
}
