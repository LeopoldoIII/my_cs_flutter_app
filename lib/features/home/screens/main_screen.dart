import 'package:flutter/material.dart';
import 'package:my_cs_flutter_app/features/button_feature/screens/button_screen.dart'; 
import 'package:my_cs_flutter_app/features/date_picker_feature/screens/date_picker_screen.dart';
import 'package:my_cs_flutter_app/features/progress_indicator_feature/screens/progress_screen.dart';
import 'package:my_cs_flutter_app/features/radio_button_feature/screens/radio_button_screeen.dart'; 
import 'package:my_cs_flutter_app/features/switch_features/screens/switch_screen.dart';
import 'package:my_cs_flutter_app/features/slider_feature/screens/slider_screen.dart';
import 'package:my_cs_flutter_app/shared/widgets/custom_app_bar.dart';
import 'package:my_cs_flutter_app/shared/widgets/custom_card_widget.dart'; 

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          CustomCardWidget(
            title: 'Button',
            leading: Icons.touch_app,
            destination: ButtonScreen(),
          ),
          CustomCardWidget(
            title: 'Radio Button',
            leading: Icons.radio_button_checked,
            destination: RadioButtonScreen(),
          ),
          CustomCardWidget(
            title: 'Switch',
            leading: Icons.toggle_on,
            destination: SwitchScreen(),
          ),
          CustomCardWidget(
            title: 'Slider',
            leading: Icons.tune,
            destination: SliderScreen(),
          ),
          CustomCardWidget(
            title: 'Progress Indicator',
            leading: Icons.tune,
            destination: ProgressScreen(),
          ),
          CustomCardWidget(
            title: 'Date Picker',
            leading: Icons.calendar_today,
            destination: DatePickerScreen(),
          )
        ],
      ),
    );
  }
}
