import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({this.message = "No Data Found", super.key});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 12),
    );
  }
}
