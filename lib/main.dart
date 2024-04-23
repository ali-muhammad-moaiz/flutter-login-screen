import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'ui_helper/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange))),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Dummy data'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    var names = [
      "Steve J",
      "Winston C",
      "Theodore R",
      "Thomas E"
      // Add more quotes as needed
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Login screen", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: 500,
              height: 270,
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 80,
                    child: TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                          hintText: "Enter your phone number",
                          enabled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          disabledBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 80,
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: (){
                              setState(() {
                                _obscurePassword = !_obscurePassword;   //toggle
                              });
                            },
                          ),
                          hintText: "Enter your password",
                          enabled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          disabledBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        print("Phone number: ${phoneNumberController.text.toString()}");
                        print("Password: ${passwordController.text.toString()}");
                      },
                      child: Container(
                          width: 75,
                          color: Colors.orangeAccent,
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ))))
                ],
              ),
            ),
          ),
        ));
  }
}
