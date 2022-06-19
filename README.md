<p align="center">
<h2 align="center">A simple and flexible Flutter close app plugin</h2>

<h4 align="center">(Android press 2 times to return to close, MacOS, iOS, Windows, Linux one-click close)</h4>
</p>
<p align="center">
<a href="https://pub.dev/packages/flutter_close_app"><img src=https://img.shields.io/badge/pub-v1.0.0-success></a>
<a href="https://github.com/yy1300326388/flutter_close_app"><img src=https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20MacOS%20%7C%20Windows%20%7C%20Linux-brightgreen></a>
<a href="https://github.com/yy1300326388/flutter_close_app/actions/workflows/flutter.yml"><img src="https://github.com/yy1300326388/flutter_close_app/actions/workflows/flutter.yml/badge.svg"></a>
<a href="https://github.com/yy1300326388/flutter_close_app"><img src=https://img.shields.io/github/stars/yy1300326388/flutter_close_app?color=brightgreen></a>
<a href="https://github.com/yy1300326388/flutter_close_app/blob/master/LICENSE"><img src=https://img.shields.io/badge/license-MIT-brightgreen></a>
</p>

- [中文说明](https://github.com/yy1300326388/flutter_close_app/tree/master/README_CN.md)

## Feature

- ✅ Press back 2 times to close app
     - ✅ Custom time interval
     - ✅ Customize the prompt message
     - ✅ Customize matching conditions
     - ✅ Support Android
- ✅ One click to close app
     - ✅ Support iOS
     - ✅ Support MacOS
     - ✅ Support Windows
     - ✅ Support Linux
## Screenshot

![](https://github.com/yy1300326388/flutter_close_app/raw/master/example/images/example.gif)


## Use

- Dependent

``` shell
flutter pub add flutter_close_app
```
- Or

``` ymal
dependencies:
  flutter_close_app: ^1.0.0
```

- Import package
``` dart
import 'package:flutter_close_app/flutter_close_app.dart';
```

## Example

- Press back 2 times to close app

``` dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterCloseAppPage(
      onCloseFailed: () {
        // Condition does not match: the first press or the second press interval is more than 2 seconds, display a prompt message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Press again to exit 🎉'),
        ));
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ...
      ),
    );
  }
}
```

- One click to close app

``` dart
FlutterCloseApp.close();
```

- Advanced usage

``` dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterCloseAppPage(
+      interval: 3, // Custom interval is 3 seconds
+      condition: tabIndex == 0, // Only close the app on the home page
      onCloseFailed: () {
        // Not the homepage does not prompt
+        if(tabIndex != 0) return;
        // Condition does not match: the first press or the second press interval is more than 2 seconds, display a prompt message
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Press again to exit 🎉'),
        ));
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ...
      ),
    );
  }
}
```

## Issues and feedback

Please file [issues](https://github.com/yy1300326388/flutter_close_app/issues) to send feedback or report a bug. Thank you!

## LICENSE

- [MIT](https://github.com/yy1300326388/flutter_close_app/blob/master/LICENSE)


