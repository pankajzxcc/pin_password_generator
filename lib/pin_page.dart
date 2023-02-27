import 'package:flutter/material.dart';
import 'package:password_generator/main.dart';


// ignore: camel_case_types
class pin_Page extends StatefulWidget {
  const pin_Page({super.key});

  @override
  State<pin_Page> createState() => _pin_PageState();
}

// ignore: camel_case_types
class _pin_PageState extends State<pin_Page> {

  dynamic num1 = "tap ";
  dynamic num2 = "to ";
  dynamic num3 = " ";
  dynamic num4 = "generate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            RawMaterialButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage(),),);
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  const [
                    Icon(Icons.arrow_back_rounded,color: Colors.blue,),
                    SizedBox(width: 10,),
                    Text(
                      "Back to main menu",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Your generated pin is :",style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  var list = [0,1,2,3,4,5,6,7,8,9,];

                  num1=(list.toList()..shuffle()).first;
                  num2=(list.toList()..shuffle()).first;
                  num3=(list.toList()..shuffle()).first;
                  num4=(list.toList()..shuffle()).first;
                });

              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$num1",
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      "$num2",
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      "$num3",
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    Text(
                      "$num4",
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




