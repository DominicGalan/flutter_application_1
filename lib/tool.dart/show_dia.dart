import 'package:flutter/material.dart';
import 'package:flutter_application_1/tool.dart/button_desi.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController editText;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({super.key, required this.editText, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextField( 
                  controller: editText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Create New List',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonDesi(
                      text: 'Save',
                      onPressed: onSave,
                    ),
                    ButtonDesi(
                      text: 'Cancel', 
                      onPressed: onCancel,
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}