import 'package:flutter/material.dart';
import 'package:password_generator/password_page.dart';
import 'package:password_generator/pin_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage

  ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("What do you want ?", style: TextStyle(fontSize: 20),),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const pin_Page(),),);
                },
                child: const Card(
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Pin",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PasswordPage(),),);
                },
                child: const Card(
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Password",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
