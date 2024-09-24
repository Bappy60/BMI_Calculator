import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
      // darkTheme: ThemeData.dark(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onPressSelected() {
    print("Selected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(title: widget.title),
      body: Column(
        children: [
          _buildGenderSelector(),
          // _buildGHeightSlider(),
          // _buildWeightSetter(),
        ],
      ),
    );
  }

  Widget _buildGenderSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: _onPressSelected,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF111328),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.male,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: _onPressSelected,
                  child: Container(
                    // margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111328),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.female,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGHeightSlider() {
    return Container();
  }

  Widget _buildWeightSetter() {
    return const Placeholder();
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const _MyAppBar({
    required String title,
  }) : _title = title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(_title),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.square(30);
}
