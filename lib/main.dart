import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_commerce_getx_learn/common/style/theme.dart';
import 'package:flutter_woo_commerce_getx_learn/global.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/index.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      // splitScreenMode: false, // 支持分屏尺寸
      // minTextAdapt: false, // 是否根据宽 度/高度中的最小值适配文字
      builder: (context, child) {
        return RefreshConfiguration(
          headerBuilder: () => const ClassicHeader(), // 自定义刷新头部
          footerBuilder: () => const ClassicFooter(), // 自定义刷新尾部
          hideFooterWhenNotFull: true, // 当列表不满一页时,是否隐藏刷新尾部
          headerTriggerDistance: 80, // 触发刷新的距离
          maxOverScrollExtent: 100, // 最大的拖动距离
          footerTriggerDistance: 150, // 触发加载的距离
          // APP主体
          child: GetMaterialApp(
            title: 'Flutter Demo',
            // theme: ThemeData(
            //     primarySwatch: Colors.blue,
            //     appBarTheme: const AppBarTheme(
            //       backgroundColor: Colors.blue,
            //     )),
            // // 路由
            debugShowCheckedModeBanner: false,

            // 路由
            initialRoute: RouteNames.systemSplash,
            getPages: RoutePages.list,
            navigatorObservers: [RoutePages.observer],
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),

            // 多语言
            translations: Translation(), // 词典
            localizationsDelegates: Translation.localizationsDelegates, // 代理
            supportedLocales: Translation.supportedLocales, // 支持的语言种类
            locale: ConfigService.to.locale, // 当前语言种类
            fallbackLocale: Translation.fallbackLocale, // 默认语言种类

            // 样式
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            // 主题
            themeMode:
                ConfigService.to.isDarkModel ? ThemeMode.dark : ThemeMode.light,

            // builder
            builder: (context, widget) {
              widget = EasyLoading.init()(context, widget); // EasyLoading 初始化

              // 不随系统字体缩放比例
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         // backgroundColor: Colors.blue,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
