import 'dart:io';

import 'package:flutter/widgets.dart';

/// Flutter Close App Page
class FlutterCloseAppPage extends StatefulWidget {
  const FlutterCloseAppPage({
    Key? key,
    required this.child,
    this.interval = 2,
    this.onCloseFailed,
  }) : super(key: key);

  /// The widget to wrap.
  final Widget child;

  /// The interval in seconds to close the app.
  final int interval;

  /// The callback when the condition is failed.
  final VoidCallback? onCloseFailed;

  @override
  State<FlutterCloseAppPage> createState() => _FlutterCloseAppPageState();
}

class _FlutterCloseAppPageState extends State<FlutterCloseAppPage> {
  int lastTime = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!Platform.isAndroid) {
          return true;
        }
        int diff = DateTime.now().second - lastTime;
        if (diff >= 0 && diff <= widget.interval) {
          exit(0);
        } else {
          lastTime = DateTime.now().second;
          widget.onCloseFailed?.call();
          return false;
        }
      },
      child: widget.child,
    );
  }
}

/// Flutter Close App
class FlutterCloseApp {
  /// Close the app
  /// ```
  /// FlutterCloseApp.close();
  /// ```
  static void close() {
    exit(0);
  }
}
