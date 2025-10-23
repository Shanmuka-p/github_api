import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {

  final _inputctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Git bot")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0,left: 10,right: 10),
        child: Row(
          children: [
            
            Expanded(
              
              //height: MediaQuery.sizeOf(context).height,
              //width: MediaQuery.sizeOf(context).width,
              child: TextField(
                controller: _inputctrl,
                decoration: InputDecoration(
                  //prefixStyle: TextStyle(fontSize: 50),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:  Colors.amber,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(46)
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  //enabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, color: Colors.black),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
