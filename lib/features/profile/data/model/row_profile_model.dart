import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowProfileModel {
  final String? leadingIcon;
  final String? text;
  final String routePath;
  final Function(BuildContext)? onTap;

  RowProfileModel({
    this.leadingIcon,
    this.text,
    this.routePath = '',
    this.onTap,
  });

  void navigate(BuildContext context) {
    if (onTap != null) {
      onTap!(context);
    } else if (routePath.isNotEmpty) {
      context.push(routePath);
    }
  }
}