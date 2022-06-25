import 'package:fitness_app/fragments/calculator_fragment.dart';
import 'package:fitness_app/fragments/error_fragment.dart';
import 'package:fitness_app/fragments/exercises_fragment.dart';
import 'package:fitness_app/fragments/first_fragment.dart';
import 'package:fitness_app/fragments/measurements_fragment.dart';
import 'package:fitness_app/fragments/reports_fragment.dart';
import 'package:fitness_app/fragments/settings_fragment.dart';
import 'package:fitness_app/fragments/timer_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:preferences/preferences.dart';
import 'package:spotify_playback/spotify_playback.dart';
import 'credentials.dart';

class DrawerItem {
  DrawerItem(this.title, this.icon);
  String title;
  IconData icon;
}

class HomePage extends StatefulWidget {
  final List<DrawerItem> drawerItems = [
    DrawerItem('Dashboard', FontAwesomeIcons.idCardAlt),
    DrawerItem('Workout', FontAwesomeIcons.calendarWeek),
    DrawerItem('Exercises', FontAwesomeIcons.dumbbell),
    DrawerItem('Reports', FontAwesomeIcons.chartLine),
    DrawerItem('Measurements', FontAwesomeIcons.weight),
    DrawerItem('Timer', FontAwesomeIcons.stopwatch),
    DrawerItem('Calculators', FontAwesomeIcons.calculator),
    DrawerItem('Settings', FontAwesomeIcons.cog),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  bool playing = false;
  bool _connectedToSpotify = false;

  @override
  void initState() {
    super.initState();
    initConnector();
  }

  Widget _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 1:
        return FirstFragment();
      case 2:
        return ExercisesFragment();
      case 3:
        return ReportsFragment();
      case 4:
        return MeasurementsFragment();
      case 5:
        return TimerFragment();
      case 6:
        return CalculatorFragment();
      case 7:
        return SettingsFragment();

      default:
        return ErrorFragment();
    }
  }

  void _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = 24;
    final List<Widget> drawerOptions = <Widget>[];
    for (int i = 0; i < widget.drawerItems.length; i++) {
      final DrawerItem d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
        appBar: AppBar(
          // here we display the title corresponding to the fragment
          // you can instead choose to have a static title
          title: Text(widget.drawerItems[_selectedDrawerIndex].title),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                  accountName: Text('Fitness App',
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  accountEmail: null),
              Column(children: drawerOptions)
            ],
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
        floatingActionButton: FabCircularMenu(
          child: Container(),
          ringColor: Colors.blue,
          options: <Widget>[
            IconButton(
                icon: playing
                    ? Icon(FontAwesomeIcons.pause)
                    : Icon(FontAwesomeIcons.play),
                onPressed: () {
                  playPause();
                },
                iconSize: iconSize,
                color: Colors.white),
            IconButton(
                icon: Icon(FontAwesomeIcons.stepForward),
                onPressed: () {
                  skipNext();
                },
                iconSize: iconSize,
                color: Colors.white),
            IconButton(
                icon: Icon(FontAwesomeIcons.hourglassHalf),
                onPressed: () {
                  playAlarm(getIntFromSettings('timer_1_duration'));
                },
                iconSize: iconSize,
                color: Colors.white),
            IconButton(
                icon: Icon(FontAwesomeIcons.hourglassStart),
                onPressed: () {
                  playAlarm(getIntFromSettings('timer_2_duration'));
                },
                iconSize: iconSize,
                color: Colors.white),
          ],
          animationDuration: const Duration(milliseconds: 0),
          fabOpenIcon: Icon(Icons.music_note),
          fabMargin: const EdgeInsets.all(10),
          ringDiameter: 250,
          ringWidth: 60,
        ));
  }

  void playAlarm(int seconds) {
    Future.delayed(Duration(milliseconds: seconds * 1000), () {
      FlutterRingtonePlayer.playAlarm();
      Future.delayed(
          Duration(
              milliseconds: getIntFromSettings('timer_dismiss_time') * 1000),
          () {
        FlutterRingtonePlayer.stop();
      });
    });
  }

  void playPause() {
    if (playing) {
      pause();
    } else {
      if (PrefService.get('playlist_override').toString() == 'default') {
        play('spotify:playlist:' + getPlaylist(PrefService.get('playlist').toString()));
      } else {
        play('spotify:playlist:' +
            PrefService.get('playlist_override').toString());
      }
    }
    setState(() {
      playing = !playing;
    });
  }

  String getPlaylist(String playlistName) {
    if (playlistName == 'My Favourite Songs') {
      return '1BclPbEE8ioh3Zevo66w6u';
    } else if (playlistName == 'Fallout Boy') {
      return '0qtlgH8Pmn9rUdzXaLlyZ5';
    } else {
      return '1BclPbEE8ioh3Zevo66w6u';
    }
  }

  /// Initialize the spotify playback sdk, by calling spotifyConnect
  Future<void> initConnector() async {
    try {
      await SpotifyPlayback.spotifyConnect(
              clientId: Credentials.clientId,
              redirectUrl: Credentials.redirectUrl)
          .then((connected) {
        if (!mounted) return;
        // If the method call is successful, update the state to reflect this change
        setState(() {
          _connectedToSpotify = connected;
        });
      }, onError: (Object error) {
        // If the method call trows an error, print the error to see what went wrong
        print(error);
      });
    } on PlatformException {
      print('Failed to connect.');
    }
  }

  /// Play an song by spotify track/album/playlist id
  Future<void> play(String id) async {
    if (_connectedToSpotify){
      try {
        await SpotifyPlayback.play(id).then((success) {
          print(success);
        }, onError: (Exception error) {
          print(error);
        });
      } on PlatformException {
        print('Failed to play.');
      }
    }
  }

  /// Pause the currently playing track
  Future<void> pause() async {
    if (_connectedToSpotify) {
      try {
        await SpotifyPlayback.pause().then((success) {
          print(success);
        }, onError: (Exception error) {
          print(error);
        });
      } on PlatformException {
        print('Failed to pause.');
      }
    }
  }

  ///Play the next song
  Future<void> skipNext() async {
    if (_connectedToSpotify) {
      try {
        await SpotifyPlayback.skipNext().then((success) {
          print(success);
        }, onError: (Exception error) {
          print(error);
        });
      } on PlatformException {
        print('Failed to play next song.');
      }
    }
  }

  int getIntFromSettings(String settingName) {
    return int.parse(PrefService.get(settingName).toString());
  }
}
