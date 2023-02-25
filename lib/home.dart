import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Center(
          child:Text('My Personality Test'),
        )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/personality.png"),
              height: 500,
              width: 400,
            ),
            Center(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(30)
                  ), backgroundColor: Colors.pinkAccent,padding: const EdgeInsets.all(20),
                ),
                child: const Text("Know your Personality",
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