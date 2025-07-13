import 'package:flutter/material.dart';

class AddCommentField extends StatefulWidget {
  final Function(String) onCommentSubmit;
  final String? hintText;
  final String? userImage;
  final String? userName;

  const AddCommentField({super.key, 
    required this.onCommentSubmit, 
    required this.hintText,
    this.userImage,
    this.userName,
  });

  @override
  _AddCommentFieldState createState() => _AddCommentFieldState();
}

class _AddCommentFieldState extends State<AddCommentField> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // User profile image
          CircleAvatar(
            radius: 20,
            backgroundImage: widget.userImage != null && widget.userImage!.isNotEmpty
                ? NetworkImage(widget.userImage!)
                : null,
            backgroundColor: Colors.blue.shade100,
            child: widget.userImage == null || widget.userImage!.isEmpty
                ? const Icon(Icons.person, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 10),
          // Comment input field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Send button
          GestureDetector(
            onTap: () {
              if (_commentController.text.isNotEmpty) {
                widget.onCommentSubmit(_commentController.text);
                _commentController.clear(); // Clear text after submission
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue, // Button color
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Icon(
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
