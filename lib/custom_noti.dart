////THIS IS A LITTLE BIT MODIFIED VERSION OF Example Code given in Firebase
////Messaging Plugin
////WHEN U PASTE THE CODE IN UR VS CODE OR ANDROID STUDIO PLEASE Format the
////Document because it is aligned in single lines
//import 'dart:async';
//import 'dart:io';
//import 'dart:typed_data';
//import 'dart:ui';
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:http/http.dart' as http;
//import 'package:path_provider/path_provider.dart';
//import 'dart:async';
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//import 'lib_noti.dart';
//
//void main() {
//  runApp(MyAppNoti());
//}
//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//FlutterLocalNotificationsPlugin();
//class MyAppNoti extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: new PushMessagingExample(),
//        routes: <String,WidgetBuilder>{
//          "/Nexpage1":(BuildContext context)=> new Nexpage1(),
//          "/Nexpage2":(BuildContext context)=> new Nexpage2(),
//          "/Nexpage3":(BuildContext context)=> new Nexpage3(),
//        } );
//  }
//}
////INITIAL PARAMETERS
//String _homeScreenText = "Waiting for token...";
//bool _topicButtonsDisabled = false;
//final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
//final TextEditingController _topicController = new TextEditingController(text: 'topic');
//final Map<String, Item> _items = <String, Item>{};
//Item _itemForMessage(Map<String, dynamic> message) {
//  final String itemId = message['id'];
//  final Item item = _items.putIfAbsent(itemId, () => new Item(itemId: itemId))..status = message['status'];
//  return item;
//}
//
////MAIN CLASS WHICH IS THE HOMEPAGE
//class PushMessagingExample extends StatefulWidget {
//  @override
//  _PushMessagingExampleState createState() => new _PushMessagingExampleState();
//}
//
//
//class _PushMessagingExampleState extends State<PushMessagingExample> {
//  void _navigateToItemDetail(Map<String, dynamic> message) {
//    final String pagechooser= message['status'];
//    Navigator.pushNamed(context, pagechooser);
//  }
//
////CLEAR TOPIC
//  void _clearTopicText() {setState(() {_topicController.text = "";_topicButtonsDisabled = true;});}
//
////DIALOGUE
//  void _showItemDialog(Map<String, dynamic> message) {showDialog<bool>(context: context,builder: (_) => _buildDialog(context, _itemForMessage(message)),).then((bool shouldNavigate) {if (shouldNavigate == true) {_navigateToItemDetail(message);}});}
//
////WIDGET WHICH IS GOING TO BE CALLED IN THE ABOVE DIALOGUE
//  Widget _buildDialog(BuildContext context, Item item) {return new AlertDialog(content: new Text("Item ${item.itemId} has been updated"),actions: <Widget>[new FlatButton(child: const Text('CLOSE'),onPressed: () {Navigator.pop(context, false);},),new FlatButton(child: const Text('SHOW'),onPressed: () {Navigator.pop(context, true);},),]);}
//  Future<void> _showNotification() async {
//    print("here 1");
//    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//        '00', 'mk', 'your channel description',
//        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
//    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//    var platformChannelSpecifics = NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
//
//    print("here 2");
//  }
//  Future selectNotification(String payload) async {
//    if (payload != null) {
//      debugPrint('notification payload: ' + payload);
//    }
//    await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => (Nexpage1())),
//    );
//  }
//  Future onDidReceiveLocalNotification(
//      int id, String title, String body, String payload) async {
//    // display a dialog with the notification details, tap ok to go to another page
//    showDialog(
//      context: context,
//      builder: (BuildContext context) => CupertinoAlertDialog(
//        title: Text(title),
//        content: Text(body),
//        actions: [
//          CupertinoDialogAction(
//            isDefaultAction: true,
//            child: Text('Ok'),
//            onPressed: () async {
//              Navigator.of(context, rootNavigator: true).pop();
//              await Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => Nexpage2(),
//                ),
//              );
//            },
//          )
//        ],
//      ),
//    );
//  }
//  @override
//   initState()  {
//    super.initState();
//    doMyAwait();
//
//
////    _firebaseMessaging.configure(
////      onLaunch: (Map<String, dynamic> message) async { _navigateToItemDetail(message);},
////      onResume: (Map<String, dynamic> message) async { _navigateToItemDetail(message);},
////      onMessage: (Map<String, dynamic> message) async {_showItemDialog(message);},);
////
//        _firebaseMessaging.configure( onMessage: (Map<String, dynamic> message) async {
//          _showNotification();
//
//
////          Navigator.push(
////            context,
////            MaterialPageRoute(builder: (context) => Nexpage1()),
////          );
//      print("onMessage: $message");
//      showDialog(
//        context: context,
//        builder: (context) => AlertDialog(
//          content: ListTile(
//            title: Text(message['notification']['title']),
//            subtitle: Text(message.toString()),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Ok'),
//              onPressed: () => Navigator.of(context).pop(),
//            ),
//          ],
//        ),);
//     });
//
////GETTING TOKEN FOR TESTING MANUALY
//    // _firebaseMessaging.getToken().then((String token) {assert(token != null);setState(() {_homeScreenText = "Push Messaging token: $token";});print(_homeScreenText);});}
//
//  }
//  Future<void> doMyAwait() async {
//    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
//    var initializationSettingsIOS = IOSInitializationSettings(
//        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//    var initializationSettings = InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        onSelectNotification: selectNotification);
//  }
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(  title: const Text('Push Messaging Demo'),),
//        body: new Material(
//          child: new Column(
//            children: <Widget>[
//              new Center(
//                child: new Text(_homeScreenText),
//              ),
//              new Row(children: <Widget>[
//                new Expanded(
//                  child: new TextField(
//                      controller: _topicController,
//                      onChanged: (String v) {
//                        setState(() {
//                          _topicButtonsDisabled = v.isEmpty;
//                        });
//                      }),
//                ),
//                new FlatButton(
//                  child: const Text("subscribe"),
//                  onPressed: _topicButtonsDisabled
//                      ? null
//                      : () {
//                    _firebaseMessaging
//                        .subscribeToTopic(_topicController.text);
//                    _clearTopicText();
//                  },
//                ),
//                new FlatButton(child: const Text("unsubscribe"),
//                  onPressed: _topicButtonsDisabled? null: () { _firebaseMessaging.unsubscribeFromTopic(_topicController.text);
//                  _clearTopicText();},),
//
//              ])],),));}}
//
//
//
//
//
//
////THREE DUMMY CLASSES FOR TESTING PURPOSE
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////PAGE1
//class Nexpage1 extends StatefulWidget {  @override  _Nexpage1State createState() => _Nexpage1State();}
//class _Nexpage1State extends State<Nexpage1> { @override Widget build(BuildContext context) { return Scaffold(body: new Center(child: new Text(" Page1"),));}}
//
////PAGE2
//class Nexpage2 extends StatefulWidget {  @override  _Nexpage2State createState() => _Nexpage2State();}
//class _Nexpage2State extends State<Nexpage2> {  @override  Widget build(BuildContext context) {    return Scaffold(      body: Center(child: new Text("2pending"),)      );  }}
//
////PAGE3
//class Nexpage3 extends StatefulWidget {  @override  _Nexpage3State createState() => _Nexpage3State();}
//class _Nexpage3State extends State<Nexpage3> {  @override  Widget build(BuildContext context) {    return Scaffold(      body: Center(child: new Text("3connected"),)      );  }}
//
//
////THIS IS THE CLASS WHICH IS USED TO PARSE THE INFORMATION
//class Item {
//  Item({this.itemId});
//  final String itemId;
//  StreamController<Item> _controller = new StreamController<Item>.broadcast();
//  Stream<Item> get onChanged => _controller.stream;
//  String _status;
//  String get status => _status;
//  set status(String value) {
//    _status = value;
//    _controller.add(this);
//  }
//
//  static final Map<String, Route<Null>> routes = <String, Route<Null>>{};
//  Route<Null> get route {
//    final String routeName = '/detail/$itemId';
//    return routes.putIfAbsent(
//      routeName,
//          () => new MaterialPageRoute<Null>(
//        settings: new RouteSettings(name: routeName),
//        builder: (BuildContext context) => new Nexpage3(),
//      ),
//    );
//  }
//}