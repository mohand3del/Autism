import 'package:autism/features/profile/presentation/view/widgets/contact_form.dart';
import 'package:autism/features/profile/presentation/view/widgets/profile_header_widget.dart';
import 'package:autism/features/profile/presentation/view/widgets/profile_listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_listenerts.dart';
import 'profile_header.dart';

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
    return MultiBlocListener(
      listeners: [
        ...ContactListenerts.getListeners(),
      ],
      child: ContactForm(),
    );
  }
}
