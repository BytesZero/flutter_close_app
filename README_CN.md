<p align="center">
<h2 align="center">一款简单灵活的 Flutter 关闭 App 插件</h2>

<h4 align="center">（Android 按2次返回关闭，MacOS、iOS、Windows、Linux 一键关闭）</h4>
</p>
<p align="center">
<a href="https://pub.dev/packages/flutter_close_app"><img src=https://img.shields.io/badge/pub-v1.0.0-success></a>
<a href="https://github.com/yy1300326388/flutter_close_app"><img src=https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20MacOS%20%7C%20Windows%20%7C%20Linux-brightgreen></a>
<a href="https://github.com/yy1300326388/flutter_close_app/actions/workflows/flutter.yml"><img src="https://github.com/yy1300326388/flutter_close_app/actions/workflows/flutter.yml/badge.svg"></a>
<a href="https://github.com/yy1300326388/flutter_close_app"><img src=https://img.shields.io/github/stars/yy1300326388/flutter_close_app?color=brightgreen></a>
<a href="https://github.com/yy1300326388/flutter_close_app/blob/develop/LICENSE"><img src=https://img.shields.io/badge/license-MIT-brightgreen></a>
</p>

- [English](https://github.com/yy1300326388/flutter_close_app)

## 功能
- ✅ 按 2 次返回关闭 App
    - ✅ 自定义时间间隔
    - ✅ 自定义提示信息
    - ✅ 自定义匹配条件
    - ✅ 支持 Android
- ✅ 一键关闭 App
    - ✅ 支持 iOS
    - ✅ 支持 MacOS
    - ✅ 支持 Windows
    - ✅ 支持 Linux

## 截图

![](https://github.com/yy1300326388/flutter_close_app/raw/master/example/images/example.gif)

## 使用

- 依赖

``` shell
flutter pub add flutter_close_app
```
- 或

``` ymal
dependencies:
  flutter_close_app: ^1.0.0
```

- 导入包
``` dart
import 'package:flutter_close_app/flutter_close_app.dart';
```

## 例子

- 按 2 次返回关闭 App

``` dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterCloseAppPage(
      onCloseFailed: () {
        // 条件不匹配：第一次按下或第二次按下间隔大于 2 秒，显示提示信息
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

- 一键关闭 App

``` dart
FlutterCloseApp.close();
```

- 高级用法

``` dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterCloseAppPage(
+      interval: 3, // 自定义间隔为3秒
+      condition: tabIndex == 0, // 仅仅是在首页才关闭 App
      onCloseFailed: () {
        // 不是首页不提示
+        if(tabIndex != 0) return;
        // 条件不匹配：第一次按下或第二次按下间隔大于 2 秒
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

## 问题和反馈

请在[这里](https://github.com/yy1300326388/flutter_close_app/issues)提交反馈或报告错误。 谢谢！

## LICENSE

- [MIT](https://github.com/yy1300326388/flutter_close_app/blob/master/LICENSE)


