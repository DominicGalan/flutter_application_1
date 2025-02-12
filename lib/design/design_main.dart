import 'package:flutter/material.dart';
import 'package:flutter_application_1/tool.dart/list_decor_func.dart';
import 'package:flutter_application_1/tool.dart/show_dia.dart';

class AllList extends StatefulWidget {
  const AllList({super.key});

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  final _editText = TextEditingController();  

  List rList = [
    ['Zig the Blacksmith', false],
    ['Solo Leveling', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      rList[index][1] = !rList[index][1];
    });
  }

  void createNewTab () {
  showDialog(
    context: context, 
    builder: (context){
      return DialogBox(
        editText: _editText, 
        onSave: saveNewList, 
        onCancel: () {
          setState(() {
            _editText.clear();
          });
          Navigator.pop(context);
        },
        );
      },
    );  
  }
  void saveNewList () {
    setState(() {
      rList.add([_editText.text, false]);
      _editText.clear; 
    });
    Navigator.pop(context);
  }

  void deleteList(int index){
    setState(() {
      rList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: Text(
          "All List",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(12, 10, 260, 10),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('./images/profpic.jpg'),
                  ),
                ),
              ),
              Icon(Icons.search, size: 30, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.menu, size: 30, color: Colors.white),
            ],
          ),
          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Manga List",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.add_circle_outline, color: Colors.white),
              ],
            ),
          ),
          Divider(height: 20, color: Colors.white),

          Expanded(
            child: ListView.builder(
              itemCount: rList.length,
              itemBuilder: (context, index) {
                return ListCustom(
                  mangaName: rList[index][0],
                  taskComplete: rList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunc: (context) => deleteList(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTab,
        backgroundColor: Colors.lightBlue[200],
        child: Icon(Icons.add_circle_outline,color: Colors.grey[700]),
      ),
    );
  }
}