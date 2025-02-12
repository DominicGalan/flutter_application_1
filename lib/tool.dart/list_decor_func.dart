import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListCustom extends StatelessWidget {
  final String mangaName;
  final bool taskComplete;
  final Function (bool?) onChanged;
  final Function (BuildContext)? deleteFunc;
  
  const ListCustom({
    super.key, 
    required this.taskComplete, 
    required this.onChanged, 
    required this.mangaName, 
    this.deleteFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Slidable(
                  endActionPane: ActionPane(
                    motion: StretchMotion(), 
                    children: [
                      SlidableAction(
                        onPressed: deleteFunc,
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      )
                    ],
                  ), 
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[200],
                        borderRadius: BorderRadius.circular(5),
                       ), 
                  child: Row(
                          children: [
                            Checkbox(
                              value: taskComplete, 
                              onChanged: onChanged,
                            ),
                          Text(mangaName, 
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                              decoration: taskComplete 
                              ? TextDecoration.lineThrough 
                              : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          )
        ),
      ],
    );
  }
}
