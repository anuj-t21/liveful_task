import 'package:flutter/material.dart';
import 'package:liveful_task/core/constants/app_colors.dart';
import 'package:liveful_task/core/constants/app_text_style.dart';
import 'package:liveful_task/core/utils/screen_util/screen_util.dart';
import 'package:liveful_task/features/weather/data/repository/weather_repository_impl.dart';
import 'package:liveful_task/features/weather/domain/entities/weather.dart';
import 'package:liveful_task/features/weather/presentation/widgets/weather_data_item.dart';
import 'package:liveful_task/features/weather/presentation/widgets/weather_input_field.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController cityFieldController = TextEditingController();

  Future<Weather>? weatherApiFuture;

  @override
  void dispose() {
    cityFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: AppTextStyles.clashDisplay.s20.pureWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            WeatherInputField(
              controller: cityFieldController,
              onIconTap: () async {
                setState(() {
                  weatherApiFuture = WeatherRepositoryImpl()
                      .fetchWeatherData(city: cityFieldController.text);
                });
                FocusScope.of(context).unfocus();
                cityFieldController.clear();
              },
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: FutureBuilder(
                future: weatherApiFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: AppTextStyles.clashDisplay.s16.w5,
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data as Weather;
                      return Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.gradient1,
                                AppColors.gradient2,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WeatherDataItem(
                                title: 'City',
                                subtitle: data.city,
                              ),
                              SizedBox(height: 8.h),
                              WeatherDataItem(
                                title: 'Temperature',
                                subtitle: data.temp,
                              ),
                              SizedBox(height: 8.h),
                              WeatherDataItem(
                                title: 'Condition',
                                subtitle: data.weatherCondition,
                                iconData: data.weatherConditionIcon,
                              ),
                              SizedBox(height: 8.h),
                              WeatherDataItem(
                                title: 'Description',
                                subtitle: data.weatherDescription,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const Center(
                    child: Text("Search For A City's Weather"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
