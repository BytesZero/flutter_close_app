import 'package:flutter/material.dart';
import 'package:flutter_close_app/flutter_close_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterCloseAppPage(
      interval: 2,
      onCloseFailed: () {
        // The interval is more than 2 seconds, or the return key is pressed for the first time
        print('onCloseFailed');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Press again to exit 🎉'),
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Close App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                leading: Icon(
                  Icons.android,
                  color: Colors.green,
                ),
                title: Text('Double back to exit app'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                title: const Text('Tap close app'),
                onTap: () {
                  FlutterCloseApp.close();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
