

import 'package:flutter/material.dart';

class ContactViewBody extends StatefulWidget {
  const ContactViewBody({super.key});

  @override
  State<ContactViewBody> createState() => _ContactViewBodyState();
}

class _ContactViewBodyState extends State<ContactViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Contact View Body'),
      ],
    );
  }
}