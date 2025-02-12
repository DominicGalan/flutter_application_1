import 'package:flutter/material.dart';
import 'package:flutter_application_1/act4/message_container.dart';
import 'package:flutter_application_1/act4/message_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Act 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MessageList(),
    );
  }
}

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<MessageListDesc> messaegListManage   = [
    MessageListDesc(
      name: "Jeril Cruz",
      date: "2/2/2025",
      message: "pre may nagiingay sa labas namin",
      image: "./images/1054068.jpg",
    ),
    MessageListDesc(
      name: "John Mungcal",
      date: "2/2/2025",
      message: "tara g",
      image: "./images/Solo Leveling Cha Hae In.jpg",
    ),
    MessageListDesc(
      name: "Jeremy Pangan",
      date: "2/2/2025",
      message: "https://comick.io/comic...",
      image: "./images/Image2.jpg",
    ),
    MessageListDesc(
      name: "Family",
      date: "2/2/2025",
      message: "Saan na kayo?",
      image: "./images/Family.jpg",
    ),
    MessageListDesc(
      name: "CPE 3A",
      date: "1/27/2025",
      message: "Announcement: During this time...",
      image: "./images/ICpepe.jpg",
    ),
    MessageListDesc(
      name: "Dave Nuada",
      date: "1/23/2025",
      message: "Pakisabihan sila na pumunta sila...",
      image: "./images/profpic1.jpg",
    ),
    MessageListDesc(
      name: "09762905176",
      date: "1/22/2025",
      message: "CONGRATUTALIONS!! NANALO KA NG...",
      image: "./images/Anonymous.jpg",
    ),
    MessageListDesc(
      name: "Only Boys",
      date: "1/12/2025",
      message: "*Racist* punta kana dito",
      image: "./images/onlyboys.jpg",
    ),
    MessageListDesc(
      name: "VB boys",
      date: "1/6/2025",
      message: "Kailan kayo pwede?",
      image: "./images/VB.jpg",
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Act 3: MessageList",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: ListView(
        children: messaegListManage.map((message) => MessageContainer(message: message, 
        delete: () {
          setState(() {
            messaegListManage.remove(message);
          });
        },)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      child: 
        Icon(Icons.add),),
    );
  }
}
