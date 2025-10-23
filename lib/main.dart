import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:github_api/Chatbot.dart';
import 'package:github_api/user_profiles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Myhome());
  }
}

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Image.asset("assets/logo.jpg"),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,

                style: TextStyle(color: Colors.black,fontSize: 15),
                decoration: InputDecoration(
                  
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,width: 2.0),
                    borderRadius: BorderRadius.circular(76),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Enter github username",
                  //labelText: "Enter github username",
                  //hoverColor: Colors.white,
                  //enabledBorder: InputBorder.none,
                  //labelStyle: TextStyle(color: Colors.black),
                  
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UserProfiles(username: _controller.text),
                  ),
                );
              }
            },
            child: Text("Search", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chatbot()),
          );
        },
        child: Icon(Icons.chat_bubble, color: Colors.black),
      ),
    );
  }
}
