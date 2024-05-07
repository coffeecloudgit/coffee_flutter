import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// WebView使用flutter_webview_plugin插件
/// https://pub.dev/packages/flutter_webview_plugin
// 此dart在真机上可以正常运行，但是虚拟机没法联网就不能运行，为什么不能联网这个问题还没有解决
class EmbeddH5 extends StatefulWidget {
  String title = "Coffee Cloud";
  String url = "http://192.168.68.81:3000/home";

  @override
  _EmbeddH5State createState() => _EmbeddH5State(title: title, url: url);
}

class _EmbeddH5State extends State<EmbeddH5> {
  String url;
  String title;
  _EmbeddH5State({required this.url, required this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///隐藏Debug标志
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        child: WebviewScaffold(
          url: url,
          appBar: AppBar(
            title: Text(title),
          ),
          //当WebView没加载出来前显示
          initialChild: Container(
            color: Colors.white,
            child: Center(
              child: Text("正在加载中...."),
            ),
          ),
        ),
      )),
    );
  }
}
