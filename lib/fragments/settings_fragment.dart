import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class SettingsFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PreferencePage([
      PreferenceTitle('Music'),
      createDropdownPreference('Playlist', ['My Favourite Songs', 'Fallout Boy'], 0),
      createTextFieldPreference('Playlist Override', 'default'),
      PreferenceTitle('Units'),
      createDropdownPreference('Weight', ['kg', 'lb', 'st'], 0),
      createDropdownPreference('Measurements', ['mm', 'cm', '″'], 0),
      PreferenceTitle('Timers'),
      createDropdownPreference('Timer 1 Duration' , ['15', '30', '45'], 1),
      createDropdownPreference('Timer 2 Duration' , ['60', '90', '120'], 0),
      createDropdownPreference('Timer Dismiss Time', ['1', '2', '3', '4', '5'], 2),
    ]);
  }

  DropdownPreference createDropdownPreference(String title, List<String> values, int defaultIndex){
    return DropdownPreference<dynamic>(
      title,
      convertTitleToLocalKey(title),
      defaultVal: values[defaultIndex],
      values: values
    );
  }

  TextFieldPreference createTextFieldPreference(String title, String defaultVal){
    return TextFieldPreference(
      title,
      convertTitleToLocalKey(title),
      defaultVal: defaultVal,
    );
  }

  String convertTitleToLocalKey(String title){
    return title.replaceAll(' ', '_').toLowerCase();
  }
}
