import 'package:flutter/material.dart';
import 'package:liveful_task/core/constants/app_text_style.dart';

class WeatherDataItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? iconData;
  const WeatherDataItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title : ',
          style: AppTextStyles.clashDisplay.s18.w6,
        ),
        Text(
          subtitle,
          style: AppTextStyles.clashDisplay.s18.w4,
        ),
        if (iconData != null)
          Image.network(
            'http://openweathermap.org/img/wn/${iconData}.png',
          ),
      ],
    );
  }
}
