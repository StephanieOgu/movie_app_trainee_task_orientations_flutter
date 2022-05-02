import 'package:flutter/material.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
