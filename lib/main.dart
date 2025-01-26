import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Activity 2: ChatBox'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Center(
              child: CircleAvatar(
                  backgroundImage: AssetImage('./images/profpic.jpg'),
                  radius: 30,
                ),
              ),
              Center(
                child: Text(
                "Neil Dominic Galan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white, 
                  fontFamily: 'RobotoCondensed',  
                  ),
                 ),
              ), 

// Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.settings,
                    color: Colors.red[200],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.search,
                    color: Colors.green[200],
                  ),
                ),
                Icon(
                  Icons.image,
                  color: Colors.blue[200],
                ),
              ],
            ),

// Lines
            Divider(
              height: 20,
              color: const Color.fromARGB(255, 255, 141, 141),
            ),

// Chatting time
            Container(
              color: Colors.grey,
              padding: EdgeInsets.all(10),
              child: Text("Pumasok ka ba ngayon?",
              style: TextStyle(
                letterSpacing: 1.0,
                fontFamily: 'RobotoCondensed',  
              ),
              ),
              
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment. end,
              children: [
                Container(
                  color: const Color.fromARGB(255, 94, 37, 37),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text("hindi man, ikaw?",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 241, 241),
                    letterSpacing: 1.0,
                    fontFamily: 'RobotoCondensed',  
                  ),
                  ),
                ),
              ],
            ),

            Container(
              color: Colors.grey,
              padding: EdgeInsets.all(10),
              child: Text("Nah me chillin out my house",
              style: TextStyle(
               letterSpacing: 1,
               fontFamily: 'RobotoCondensed',  
              ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment. end,
              children: [
                Container(
                  color: const Color.fromARGB(255, 94, 37, 37),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Hell yea! I like that",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontFamily: 'RobotoCondensed',  
                  ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 335),
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 185, vertical: 10),
                  child: Text(""),
                )
              ],
            )
          ],
        )
      ),

// Background
      backgroundColor: Colors. grey[900],

// Button
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green,
        child: Icon(Icons.send),
        ),
    );
  }
}
