import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Ball Printing App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  double _delayInSeconds = 1.0;
  double get delayInSeconds => _delayInSeconds;

  set delayInSeconds(double value) {
    _delayInSeconds = value;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        // Ball Bonus
        // x3 Lure Ball
        // x5 Heal Ball
        // x1 Beast Ball
        // x2 Dream Ball
        // x1 Fast Ball
        // x1 Beast Ball
        // x1 Friend Ball
        page = CountingPageSplitter(dates: [DateTime(2044, 6, 26, 8, 7, 5)]);
        // break;
      case 1:
        // Item Bonus
        // x4 Ability Patch
        // x4 Ability Patch
        // x20 Electric Tera Shard
        // x2 Razor Claw
        // x4 Ability Patch
        page = CountingPageSplitter(dates: [DateTime(2034, 11, 26, 1, 26, 8)]);
        // break;
      case 2:
        // Beast Ball
        // 4x Beast Ball, 1x Sport Ball, 1x Heavy Ball, 1x Level Ball, 1x Moon Ball, 1x Master Ball, 1x Love Ball
        page = CountingPageSplitter(dates: [
          DateTime(2010, 9, 28, 17, 19, 14),
          DateTime(2010, 9, 8, 23, 01, 10),
        ]);
      case 3:
        // Dream Ball
        // 4x Dream Ball, 2x Love Ball, 1x Friend Ball, 1x Safari Ball, 1x Beast Ball, 1x Moon Ball
        page = CountingPageSplitter(dates: [
          DateTime(2027, 8, 8, 0, 55, 32),
          DateTime(2027, 8, 8, 5, 44, 20),
        ]);
      case 4:
        // Fast Ball
        // 5x Fast Ball, 2x Lure Ball, 1x Master Ball, 1x Dream Ball, 1x Friend Ball
        page = CountingPageSplitter(dates: [
          DateTime(2047, 10, 7, 11, 7, 5),
          DateTime(2047, 10, 7, 23, 7, 31),
        ]);
      case 5:
        // Friend Ball
        // 5x Friend Ball, 1x Master Ball, 1x Fast Ball, 1x Heavy Ball, 1x Level Ball, 1x Dream Ball
        page = CountingPageSplitter(dates: [
          DateTime(2002, 12, 16, 19, 26, 44),
          DateTime(2002, 12, 16, 5, 33, 27),
        ]);
      case 6:
        // Heavy Ball
        // 4x Heavy Ball, 2x Dream Ball, 1x Love Ball, 1x Fast Ball, 1x Beast Ball, 1x Friend Ball
        page = CountingPageSplitter(dates: [
          DateTime(2054, 12, 31, 8, 20, 20),
          DateTime(2054, 12, 31, 1, 51, 36),
        ]);
      case 7:
        // Level Ball
        // 4x Level Ball, 2x Lure Ball, 2x Moon Ball, 1x Love Ball, 1x Friend Ball
        page = CountingPageSplitter(dates: [
          DateTime(2011, 11, 26, 9, 19, 33),
          DateTime(2011, 11, 26, 18, 53, 33),
        ]);
      case 8:
        // Love Ball
        // 4x Love Ball, 2x Lure Ball, 1x Fast Ball, 1x Friend Ball, 1x Moon Ball, 1x Beast Ball
        page = CountingPageSplitter(dates: [
          DateTime(2058, 5, 30, 11, 2, 24),
          DateTime(2058, 5, 30, 13, 44, 16),
        ]);
      case 9:
        // Lure Ball
        // 4x Lure Ball, 2x Love Ball, 2x Moon Ball, 1x Sport Ball, 1x Fast Ball
        page = CountingPageSplitter(dates: [
          DateTime(2004, 11, 22, 10, 3, 45),
          DateTime(2004, 11, 22, 18, 19, 21),
        ]);
      case 10:
        // Master Ball
        // 4x Master Ball, 2x Safari Ball, 1x Sport Ball, 1x Heavy Ball, 1x Friend Ball, 1x Moon Ball
        page = CountingPageSplitter(dates: [
          DateTime(2056, 9, 27, 22, 33, 25),
          DateTime(2056, 9, 27, 0, 17, 44),
        ]);
      case 11:
        // Moon Ball
        // 5x Moon Ball, 2x Lure Ball, 1x Level Ball, 1x Fast Ball, 1x Heavy Ball
        page = CountingPageSplitter(dates: [
          DateTime(2029, 5, 24, 17, 50, 5),
          DateTime(2029, 5, 24, 4, 42, 17),
        ]);
      case 12:
        // Safari Ball
        // 4x Safari Ball, 2x Heavy Ball, 1x Moon Ball, 1x Master Ball, 1x Level Ball, 1x Love Ball
        page = CountingPageSplitter(dates: [
          DateTime(2012, 9, 18, 22, 54, 21),
          DateTime(2012, 9, 18, 3, 8, 37),
        ]);
        // break;
      case 13:
        // Sport Ball
        // 3x Sport Ball, 3x Friend Ball, 2x Love Ball, 1x Lure Ball, 1x Heavy Ball
        page = CountingPageSplitter(dates: [
          DateTime(2048, 7, 13, 13, 20, 14),
          DateTime(2048, 7, 13, 1, 30, 19),
        ]);
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
  
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    // Index 0
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('10x Balls Trigger'),
                    ),
                    // Index 1
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('5x Ability Patch Trigger'),
                    ),
                    // Index 2
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/beastball.png'),
                      label: Text('Beast Balls'),
                    ),
                    // Index 3
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/dreamball.png'),
                      label: Text('Dream Balls'),
                    ),
                    // Index 4
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/fastball.png'),
                      label: Text('Fast Balls'),
                    ),
                    // Index 5
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/friendball.png'),
                      label: Text('Friend Balls'),
                    ),
                    // Index 6
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/heavyball.png'),
                      label: Text('Heavy Balls'),
                    ),
                    // Index 7
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/levelball.png'),
                      label: Text('Level Balls'),
                    ),
                    // Index 8
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/loveball.png'),
                      label: Text('Love Balls'),
                    ),
                    // Index 9
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/lureball.png'),
                      label: Text('Lure Balls'),
                    ),
                    // Index 10
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/masterball.png'),
                      label: Text('Master Balls'),
                    ),
                    // Index 11
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/moonball.png'),
                      label: Text('Moon Balls'),
                    ),
                    // Index 12
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/safariball.png'),
                      label: Text('Safari Balls'),
                    ),
                    // Index 13
                    NavigationRailDestination(
                      icon: Image.asset('assets/icons/sportball.png'),
                      label: Text('Sport Balls'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

// Create a page with 4 fields, date, time, seconds, and a start button
// It shows a prefixed date and time (without seconds)
// Seconds are shown separately
// Delay is a scroll wheel with 0.1s fixed increments from -5 to 5, default at 2
// Start button causes a countdown from seconds -delay to 0
// CountdownPage takes in a DateTime, Seconds and Delay Variable
// CountdownPage has a countdown timer that counts down from seconds-delay to 0
// Have a starting date of 16th April 2024 07:50 AM, with seconds at 8, delay at 2
class CountingPageSplitter extends StatefulWidget {
  final List<DateTime> dates;
  CountingPageSplitter({required this.dates});

  @override
  CountingPageSplitterState createState() => CountingPageSplitterState();
}

class CountingPageSplitterState extends State<CountingPageSplitter> {
  @override
  Widget build(BuildContext context) {
    List<Widget> timers = [
      Expanded(
        child: CountingPage(chosenDate: widget.dates[0])
      ),
    ];
    if (widget.dates.length > 1) {
      timers.insert(0, Expanded(
        child: CountingPage(chosenDate: widget.dates[1])
      ));
    }

    return Column(
      children: timers,
    );
  }
}

class CountingPage extends StatefulWidget {
  final DateTime chosenDate;

  CountingPage({required this.chosenDate});

  @override
  State<CountingPage> createState() => _CountingPageState();
}

class _CountingPageState extends State<CountingPage> {
  Timer? _timer;
  Stopwatch _stopwatch = Stopwatch();
  // Set ChosenDate as date and time without seconds
  
  @override
  void initState() {
    super.initState();
    _resetStopwatch();
  }

  void _resetStopwatch() {
    _stopwatch.stop();
    _stopwatch.reset();
  }

  @override
  void didUpdateWidget(CountingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _resetStopwatch();
  }

  @override
  Widget build(BuildContext context) {
    final delayInSeconds = Provider.of<MyAppState>(context).delayInSeconds;
    // Get seconds from formattedDate1

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Make the Text larger
          Text(
            'Date: ${DateFormat('MM/dd/yyyy hh:mm a').format(widget.chosenDate)}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Delay: ${delayInSeconds.toStringAsFixed(1)} seconds',
            style: TextStyle(fontSize: 20),
          ),
          Slider(
            value: delayInSeconds,
            min: 0,
            max: 10,
            divisions: 100,
            label: delayInSeconds.toStringAsFixed(1),
            onChanged: (double value) {
              setState(() {
                Provider.of<MyAppState>(context, listen: false).delayInSeconds = value;
              });
            },
          ),
          Text('Countdown: ${(widget.chosenDate.second - delayInSeconds - _stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(1)}'),
          SizedBox(width: 10),
          ElevatedButton(
                onPressed: () {
                  _stopwatch.start();
                  _timer?.cancel();
                  _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
                    setState(() {
                      if (_stopwatch.elapsedMilliseconds / 1000 >= widget.chosenDate.second) {
                        _stopwatch.stop();
                        _stopwatch.reset();
                        _timer?.cancel();
                      }
                    });
                  });
                },
                child: Text('Start Timer'),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    _resetStopwatch();
    super.dispose();
  }
}