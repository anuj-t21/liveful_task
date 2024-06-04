import 'package:flutter/material.dart';

class WeatherInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onIconTap;
  const WeatherInputField({
    super.key,
    required this.controller,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Enter City Name',
        suffixIcon: InkWell(
          onTap: onIconTap,
          child: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
