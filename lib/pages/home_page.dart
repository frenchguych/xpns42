import 'package:flutter/material.dart';
import 'package:xpns42/misc/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create scaffold
    final scaffold = Scaffold(
      appBar: AppBar(
        title: const Text(kAppName),
      ),
    );

    return scaffold;
  }
}
