import 'package:flutter/material.dart';

class InformationMessage extends StatelessWidget {
  final String message;
  const InformationMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
