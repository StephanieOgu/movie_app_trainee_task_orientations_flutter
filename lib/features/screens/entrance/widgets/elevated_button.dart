import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    Key? key,
    required this.btnLabel,
    required this.onPress,
  }) : super(key: key);

  final String btnLabel;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50,
        width: 250,
        child: _buildBtn(context),
      ),
    );
  }

  ElevatedButton _buildBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      child: _buildLabel(context),
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      btnLabel,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
