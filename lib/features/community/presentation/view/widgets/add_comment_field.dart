import 'package:flutter/material.dart';

class AddCommentField extends StatefulWidget {
  final Function(String) onCommentSubmit;

  AddCommentField({required this.onCommentSubmit});

  @override
  _AddCommentFieldState createState() => _AddCommentFieldState();
}

class _AddCommentFieldState extends State<AddCommentField> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Comment input field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50, // Light blue background color
                borderRadius: BorderRadius.circular(16.0), // Rounded corners
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: "Add Comment",
                  hintStyle: TextStyle(color: Colors.grey), // Light grey hint text
                  border: InputBorder.none, // No border
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          // Send button
          GestureDetector(
            onTap: () {
              if (_commentController.text.isNotEmpty) {
                widget.onCommentSubmit(_commentController.text);
                _commentController.clear(); // Clear text after submission
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue, // Button color
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.send, // Send icon
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
