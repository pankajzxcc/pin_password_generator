import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/main.dart';
import 'dart:math';


class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override


  State<PasswordPage> createState() => _PasswordPageState();
}

@override


class _PasswordPageState extends State<PasswordPage> {
  final lengthcontroller = TextEditingController();
  @override
  void dispose() {
    lengthcontroller.dispose();
    super.dispose();
  }

  dynamic passwordgain = '';
  bool hasupperletter = true;
  bool haslowerletter = true;
  bool hasspecial = true;
  bool hasnumber = true;
  bool _validate = false;
  bool visiblee = false;

  @override
  Widget build(BuildContext context) {

    String genratedpassword() {
      int length = int.parse(lengthcontroller.text);
      const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      const lowercase = 'abcdefghijklmnopqrstuvwxyz';
      const special = '~!@#%^&*()_;+[]}<>,.\$';
      const number = '0123456789';

      String chars = '';
      if (hasupperletter) chars += uppercase;
      if (haslowerletter) chars += lowercase;
      if (hasspecial) chars += special;
      if (hasnumber) chars += number;
      return List.generate(length, (index) {
        final indexRandom = Random.secure().nextInt(chars.length);
        return chars[indexRandom];
      }).join('');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Back to main menu",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              width: 250,
              child: TextField(
                controller: lengthcontroller,
                keyboardType: TextInputType.number,
                maxLength: 2,
                cursorHeight: 20,
                decoration: InputDecoration(
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  hintText: 'Enter password length',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        passwordgain = '';
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Text(
              "Your generated password is : ",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "$passwordgain",
                style: const TextStyle(fontSize: 20,color: Colors.green),
              ),
            ),
            Visibility(
              visible: visiblee,
              child: InkWell(
                child:  const Text('copy this password in clipboard', style: TextStyle(fontSize: 20,color: Colors.blue),),
                onTap: () {
                  final data = ClipboardData(text: passwordgain);
                  Clipboard.setData(data);
                  setState(() {
                    visiblee = false;
                  });

                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'should contain uppercase',
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                  value: hasupperletter,
                  onChanged: (value) {
                    setState(() {
                      hasupperletter = value;
                    });
                  },
                  thumbColor: const Color(0xff263238),
                  activeColor: const Color(0xff757575),
                  trackColor: const Color(0xff757575),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'should contain lowerletter',
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                  value: haslowerletter,
                  onChanged: (value) {
                    setState(() {
                      haslowerletter = value;
                    });
                  },
                  thumbColor: const Color(0xff263238),
                  activeColor: const Color(0xff757575),
                  trackColor: const Color(0xff757575),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'should contain special character',
                  style: TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(
                  value: hasspecial,
                  onChanged: (value) {
                    setState(() {
                      hasspecial = value;
                    });
                  },
                  thumbColor: const Color(0xff263238),
                  activeColor: const Color(0xff757575),
                  trackColor: const Color(0xff757575),
                ),
              ],
            ),

            RawMaterialButton(
              onPressed: () {
                setState(() {
                  if (lengthcontroller.text.isEmpty) {
                    _validate = true;
                  } else {
                    _validate = false;
                    final password = genratedpassword();
                    passwordgain = password;
                    visiblee = true;
                  }
                });
              },
              child: const Card(
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Generate",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
