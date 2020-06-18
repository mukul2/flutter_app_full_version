//THIS IS A LITTLE BIT MODIFIED VERSION OF Example Code given in Firebase
//Messaging Plugin
//WHEN U PASTE THE CODE IN UR VS CODE OR ANDROID STUDIO PLEASE Format the
//Document because it is aligned in single lines

import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    new MaterialApp(
        home: new PushMessagingExample(),
        routes: <String,WidgetBuilder>{
          "/Nexpage1":(BuildContext context)=> new Nexpage1(),
          "/Nexpage2":(BuildContext context)=> new Nexpage2(),
          "/Nexpage3":(BuildContext context)=> new Nexpage3(),
        } ),);}


//INITIAL PARAMETERS
String _homeScreenText = "Waiting for token...";
bool _topicButtonsDisabled = false;
final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
final TextEditingController _topicController = new TextEditingController(text: 'topic');
final Map<String, Item> _items = <String, Item>{};
Item _itemForMessage(Map<String, dynamic> message) {
  final String itemId = message['id'];
  final Item item = _items.putIfAbsent(itemId, () => new Item(itemId: itemId))..status = message['status'];
  return item;
}

//MAIN CLASS WHICH IS THE HOMEPAGE
class PushMessagingExample extends StatefulWidget {
  @override
  _PushMessagingExampleState createState() => new _PushMessagingExampleState();
}


class _PushMessagingExampleState extends State<PushMessagingExample> {
  void _navigateToItemDetail(Map<String, dynamic> message) {
    final String pagechooser=message["data"]["status"].toString();

   // showThisToast(message["data"]["status"].toString());

  //  Navigator.pushNamed(context, pagechooser);

    //Share.share(pagechooser);
    launch(pagechooser);
  }

//CLEAR TOPIC
  void _clearTopicText() {setState(() {_topicController.text = "";_topicButtonsDisabled = true;});}

//DIALOGUE
  void _showItemDialog(Map<String, dynamic> message) {showDialog<bool>(context: context,builder: (_) => _buildDialog(context, _itemForMessage(message)),).then((bool shouldNavigate) {if (shouldNavigate == true) {_navigateToItemDetail(message);}});}

//WIDGET WHICH IS GOING TO BE CALLED IN THE ABOVE DIALOGUE
  Widget _buildDialog(BuildContext context, Item item) {return new AlertDialog(content: new Text("Item ${item.itemId} has been updated"),actions: <Widget>[new FlatButton(child: const Text('CLOSE'),onPressed: () {Navigator.pop(context, false);},),new FlatButton(child: const Text('SHOW'),onPressed: () {Navigator.pop(context, true);},),]);}


  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async { _navigateToItemDetail(message);},
      onResume: (Map<String, dynamic> message) async { _navigateToItemDetail(message);},
      onMessage: (Map<String, dynamic> message) async {_navigateToItemDetail(message);},);

//GETTING TOKEN FOR TESTING MANUALY
    _firebaseMessaging.getToken().then((String token) {assert(token != null);setState(() {_homeScreenText = "Push Messaging token: $token";});print(_homeScreenText);});}



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(  title: const Text('Push Messaging Demo'),),
        body: new Material(
          child: new Column(
            children: <Widget>[
              new Center(
                child: new Text(_homeScreenText),
              ),
              new Row(children: <Widget>[
                new Expanded(
                  child: new TextField(
                      controller: _topicController,
                      onChanged: (String v) {
                        setState(() {
                          _topicButtonsDisabled = v.isEmpty;
                        });
                      }),
                ),
                new FlatButton(
                  child: const Text("subscribe"),
                  onPressed: _topicButtonsDisabled
                      ? null
                      : () {
                    _firebaseMessaging
                        .subscribeToTopic(_topicController.text);
                    _clearTopicText();
                  },
                ),
                new FlatButton(child: const Text("unsubscribe"),
                  onPressed: _topicButtonsDisabled? null: () { _firebaseMessaging.unsubscribeFromTopic(_topicController.text);
                  _clearTopicText();},),

              ])],),));}}




//THREE DUMMY CLASSES FOR TESTING PURPOSE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//PAGE1
class Nexpage1 extends StatefulWidget {  @override  _Nexpage1State createState() => _Nexpage1State();}
class _Nexpage1State extends State<Nexpage1> { @override Widget build(BuildContext context) { return Scaffold(body: new Center(child: new Text(" Page1"),));}}

//PAGE2
class Nexpage2 extends StatefulWidget {  @override  _Nexpage2State createState() => _Nexpage2State();}
class _Nexpage2State extends State<Nexpage2> {  @override  Widget build(BuildContext context) {    return Scaffold(      body: Center(child: new Text("2pending"),)      );  }}

//PAGE3
class Nexpage3 extends StatefulWidget {  @override  _Nexpage3State createState() => _Nexpage3State();}
class _Nexpage3State extends State<Nexpage3> {  @override  Widget build(BuildContext context) {    return Scaffold(      body: Center(child: new Text("3connected"),)      );  }}


//THIS IS THE CLASS WHICH IS USED TO PARSE THE INFORMATION
class Item {
  Item({this.itemId});
  final String itemId;
  StreamController<Item> _controller = new StreamController<Item>.broadcast();
  Stream<Item> get onChanged => _controller.stream;
  String _status;
  String get status => _status;
  set status(String value) {
    _status = value;
    _controller.add(this);
  }

  static final Map<String, Route<Null>> routes = <String, Route<Null>>{};
  Route<Null> get route {
    final String routeName = '/detail/$itemId';
    return routes.putIfAbsent(
      routeName,
          () => new MaterialPageRoute<Null>(
        settings: new RouteSettings(name: routeName),
        builder: (BuildContext context) => new Nexpage3(),
      ),
    );
  }
}

void showThisToast(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}