import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child:Text('10 Questions About Aristotle'),
        )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/logo1.png"),
              height: 500,
              width: 300,
            ),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ),padding: EdgeInsets.all(20),
                  primary: Colors.teal,
                ),
                child: const Text("Play the Quiz",
                  style: TextStyle(
                  fontSize: 18,
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