import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../components/httpController.dart';
import '../components/accessController.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _flutterWebviewPlugin=new FlutterWebviewPlugin();
  @override
  void initState(){
    super.initState();
    //添加webview监听
    _flutterWebviewPlugin.onUrlChanged.listen((url){
      AccessController.loadOauth2AccessToken(url);
    });

  }
  @override
  Widget build(BuildContext context){
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text("登录"),
      ),
      url: HttpController.getOauth2Authorize(),
    );
  }
}