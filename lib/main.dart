import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:kobita/passData.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async' show Future;
import 'dart:async';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kobita/passData.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:io';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

//import 'dart:html';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kobita/AppAllData.dart';
<<<<<<< Updated upstream
import 'package:webview_flutter/webview_flutter.dart';
=======
import 'package:rxdart/rxdart.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kobita/custom_noti.dart';
>>>>>>> Stashed changes

import 'AnotherMusicPlayer.dart';
import 'CategoryActivity.dart';
import 'CustomBodyModel.dart';
import 'FullPDFViewerOnline.dart';
import 'MyAudioPlayer.dart';
import 'MyMusicPLayer.dart';
import 'OnlinePDFScreen.dart';
import 'custom_noti.dart';
import 'customweb.dart';
import 'lib_noti.dart';
import 'local_files.dart';
import 'myAd.dart';

<<<<<<< Updated upstream
=======
String APP_NAME = "App Name Here";
String APP_SHARE_LINK = "https://www.youtube.com";

String APP_ID_ANDROID = 'ca-app-pub-3940256099942544~3347511713';
String APP_ID_IOS = 'ca-app-pub-3940256099942544~1458002511';

String INT_ADD_ID_ANDROID = 'ca-app-pub-3940256099942544/1033173712';
String INT_ADD_ID_IOS = 'ca-app-pub-3940256099942544/4411468910';

String BANNER_ADD_ID_ANDROID = 'ca-app-pub-3940256099942544/6300978111';
String BANNER_ADD_ID_IOS = 'ca-app-pub-3940256099942544/2934735716';

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return INT_ADD_ID_IOS;
  } else if (Platform.isAndroid) {
    return INT_ADD_ID_ANDROID;
  }
  return null;
}

String getAppId() {
  if (Platform.isIOS) {
    return APP_ID_IOS;
  } else if (Platform.isAndroid) {
    return APP_ID_ANDROID;
  }
  return null;
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return BANNER_ADD_ID_IOS;
  } else if (Platform.isAndroid) {
    return BANNER_ADD_ID_ANDROID;
  }
  return null;
}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
BehaviorSubject<String>();

NotificationAppLaunchDetails notificationAppLaunchDetails;

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}


>>>>>>> Stashed changes
void main() {
  Admob.initialize(getAppId());
  runApp(MyApp());
}

int CLICK_COUNTER = 0;
<<<<<<< Updated upstream
int SHOW_AD_AFTER = 5;
=======

int SHOW_AD_AFTER = 0;

>>>>>>> Stashed changes
var isLoading = true;
bool doINeedDownload = true;
bool doIHaveDownloadPermission = false;
bool didPassedFirstTest = false;
bool isAnimationRunning = false;
<<<<<<< Updated upstream

=======
bool loadFromOnline = false;
bool _isInterstitialAdLoaded = false;
bool _isFBBannerAdLoaded = false;
>>>>>>> Stashed changes
var isPDFLoading = false;
var isPDFLocal = true;
var selectedSecondayCatID;
var selectedOwnCatID;
String fileData;
AdmobInterstitial interstitialAd;
AppAllData appAllDataCached;
List<Collections> secondLevelContents = new List();
FacebookBannerAd bannerFB;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'My Blog Application'),

    );
  }
}
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
Future<String> _loadAsset() async {
  isLoading = true;
  fileData = await rootBundle.loadString('assets/data.json');
  return fileData;
}

Future<String> _loadAssetFromNet() async {
  isLoading = true;
  var url = 'http://appointmentbd.com/other-project/kobita11.php';

  // Await the http get response, then decode the json-formatted response.

  var response = await http.get(url);
  //showThisToast(response.body.toString());
  fileData = response.body;
  return response.body;
}

Future<AppAllData> loadProjectData() async {
  String jsonString = await _loadAssetFromNet();
  final jsonResponse = json.decode(jsonString);
  AppAllData data = new AppAllData.fromJson(jsonResponse);
  appAllDataCached = data;
  return data;
}

Future<List<Categories>> loadCategories() async {
  List<Categories> firstLevelCategory = new List();
  AppAllData appAllData = await loadProjectData();
  isLoading = false;
  for (var i = 0; i < appAllData.categories.length; i++) {
    if (appAllData.categories[i].parentId == 0) {
      firstLevelCategory.add(appAllData.categories[i]);
    }
  }
  return firstLevelCategory;
}

Future<myRetrivedData> loadSecondaryCategories() async {
  isLoading = true;
  List<Categories> secondLevelCategory_ = new List();
  List<Collections> secondLevelContents_ = new List();
  AppAllData appAllData = appAllDataCached;

  for (var i = 0; i < appAllData.categories.length; i++) {
    if (appAllData.categories[i].parentId == selectedSecondayCatID) {
      secondLevelCategory_.add(appAllData.categories[i]);
    }
  }
  if (secondLevelCategory_.length == 0) {
    //   showThisToast("No category, searching for contents");
    for (var i = 0; i < appAllData.collections.length; i++) {
      if (appAllData.collections[i].categoryId == selectedSecondayCatID) {
        secondLevelContents_.add(appAllData.collections[i]);
      }
    }
  }

  bool ty = true;
  if (secondLevelCategory_.length > 0) {
    ty = true;
  } else {
    ty = false;
  }

  myRetrivedData data = new myRetrivedData(
      categories: secondLevelCategory_,
      collections: secondLevelContents_,
      isCategory: ty);
  isLoading = false;
  return data;
}

_showInterstitialAd() {
  if (_isInterstitialAdLoaded == true)
    FacebookInterstitialAd.showInterstitialAd();
  else
    showThisToast("fb ad is not loaded yet");
  print("Interstial Ad not yet loaded!");
}

void load_fb_banner(){
  bannerFB = FacebookBannerAd(
    placementId:
    "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047", //testid
    bannerSize: BannerSize.STANDARD,
    listener: (result, value) {
      print("Banner Ad: $result -->  $value");
      showThisToast("Banner Ad: $result -->  $value");
      if(result==BannerAdResult.LOADED){
        _isFBBannerAdLoaded = true ;
      }
    },
  );
}

void _loadInterstitialAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
    //"IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617" YOUR_PLACEMENT_ID
    listener: (result, value) {
      print(">> FAN > Interstitial Ad: $result --> $value");
      if (result == InterstitialAdResult.LOADED) {
        _isInterstitialAdLoaded = true;
        //FacebookInterstitialAd.showInterstitialAd();
        showThisToast("fb ad is  loaded ");
      }

      /// Once an Interstitial Ad has been dismissed and becomes invalidated,
      /// load a fresh Ad by calling this function.
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        _isInterstitialAdLoaded = false;
        _loadInterstitialAd();
      }
    },
  );
}

createPostList(id) async {
  secondLevelContents.clear();
  AppAllData appAllData = await loadProjectData();
  for (var i = 0; i < appAllData.collections.length; i++) {
    if (appAllData.collections[i].categoryId == id) {
      secondLevelContents.add(appAllData.collections[i]);
    }
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/4411468910';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/1033173712';
  }
  return null;
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  void _navigateToItemDetail(Map<String, dynamic> message) {
    final String pagechooser=message["data"]["status"].toString();
    launch(pagechooser);
  }

  AnimationController animationController;
  Animation<double> animation;
//DIALOGUE
  void _showItemDialog(Map<String, dynamic> message) {showDialog<bool>(context: context,builder: (_) => _buildDialog(context, _itemForMessage(message)),).then((bool shouldNavigate) {if (shouldNavigate == true) {_navigateToItemDetail(message);}});}

//WIDGET WHICH IS GOING TO BE CALLED IN THE ABOVE DIALOGUE
  Widget _buildDialog(BuildContext context, Item item) {return new AlertDialog(content: new Text("Item ${item.itemId} has been updated"),actions: <Widget>[new FlatButton(child: const Text('CLOSE'),onPressed: () {Navigator.pop(context, false);},),new FlatButton(child: const Text('SHOW'),onPressed: () {Navigator.pop(context, true);},),]);}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    FacebookAudienceNetwork.init(
      testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41",
    );
    load_fb_banner();
    _loadInterstitialAd();
    
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // custom code here
        isAnimationRunning = false;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SpActtivity()));
      }
    });

    // FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);

    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        //handleEvent(event, args, 'Interstitial');
      },
    );
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
      onLaunch: (Map<String, dynamic> message) async { _navigateToItemDetail(message);},
      onResume: (Map<String, dynamic> message) async { _navigateToItemDetail(message);},
      onMessage: (Map<String, dynamic> message) async {_navigateToItemDetail(message);},);
//    _firebaseMessaging.configure( onMessage: (Map<String, dynamic> message) async {
//      print("onMessage: $message");
//      showDialog(
//        context: context,
//        builder: (context) => AlertDialog(
//          content: ListTile(
//            title: Text(message['notification']['title']),
//            subtitle: Text(message['notification']['body']),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Ok'),
//              onPressed: () => Navigator.of(context).pop(),
//            ),
//          ],
//        ),);
//  });
  }

  @override
  Widget build(BuildContext context) {
    //   _bannerAd ??= _createBannerAd();
    //   showBannerAd(context);
    //  Ads.setBannerAd();
    //  Ads.showBannerAd();

    return Scaffold(
      body: FutureBuilder(
        builder: (context, projectSnap_) {
          return (false)
              ? new Container(
                  child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: new Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AdmobBanner(
                            adUnitId: getBannerAdUnitId(),
                            adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
                          ),
                          new Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: new Card(
                              color: Colors.blue,
                              child: new Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.description,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Start Application',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    if (animationController.status ==
                                            AnimationStatus.forward ||
                                        animationController.status ==
                                            AnimationStatus.completed) {
                                      animationController.reverse();
                                    } else {
                                      animationController.forward();
                                    }
//                                Ads.hideBannerAd();
//
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(builder: (context) => MainActivity()),
//                                );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    )
                  ],
                ))
              : CircularRevealAnimation(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.pink),
                    ),
                  ),
                  animation: animation,
                  centerAlignment: Alignment.bottomCenter,
                );
        },
        future: loadFirstAnimation(),
      ),
    );
  }

  Future<bool> loadFirstAnimation() {
    animationController.forward();
    isAnimationRunning = true;
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // custom code here
        isAnimationRunning = false;
        return false;
      } else
        return true;
    });
  }
}

Widget SplashScreen(context) {
  return Stack(
    children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: AdmobBanner(
          adUnitId: getBannerAdUnitId(),
          adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
        ),
      ),


      Positioned(
        bottom: 100.0,
        left: 0.0,
        right: 0.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.pink,
            child: new Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: ListTile(
                leading: Icon(
                  Icons.description,
                  color: Colors.white,
                ),
                title: Text(
                  'Start Application',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                onTap: () {
//                                Ads.hideBannerAd();
//
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainActivity()),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      Positioned(
          bottom: 50.0,
          left: 0.0,
          right: 0.0,
          child: Center(
              child: Wrap(children: <Widget>[
            Card(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                width: 120,
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Rate us",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))),
              ),
            ),
            Card(
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                    width: 120,
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("More Apps",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))))))
          ])))
    ],
  );
}

Widget downlaodAndShowPDF(String link, BuildContext context) {
  return FutureBuilder(
    builder: (context, projectSnap) {
      return isPDFLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewerScaffold(
              appBar: AppBar(
                title: Text("Document"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
              path: projectSnap.data);
    },
    future: isPDFLocal ? copyAsset(link) : createFileOfPdfUrl(link, context),
  );
}

Widget projectWidget() {
  return FutureBuilder(
    builder: (context, projectSnap) {
      return isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: <Widget>[
                Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    bottom: 60,
                    child: GridView.builder(
                      itemCount: projectSnap.data.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        Categories categories = projectSnap.data[index];
                        bool isImageLive = false;
                        String localPath =
                            "assets/android_asset/apps/offline/image.png";
                        if (categories.iconUrl != null) {
                          if (categories.iconUrl.toString().contains("http")) {
                            isImageLive = true;
                          } else {
                            if (categories.iconUrl
                                .toString()
                                .contains("assets:")) {
                              localPath = categories.iconUrl
                                  .toString()
                                  .replaceRange(0, 8, '');
                              localPath = "assets/android_asset" + localPath;
                            }
                          }
                        } else {
                          localPath =
                              "assets/android_asset/apps/offline/image.png";
                        }

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: InkResponse(
                              onTap: () {
                                handleInsAddEvent();
                                selectedSecondayCatID = categories.id;
                                selectedOwnCatID = categories.id;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondActivity(
                                          text: categories.title)),
                                );
                              },
                              child: new Center(
                                child: new Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: isImageLive
                                          ? Image.network(categories.iconUrl,
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.fill)
                                          : Image.asset(localPath,
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.fill),
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 8, 8, 0),
                                        child: Text(categories.title,
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              )),
                        );
                      },
                    )),
                Positioned(
                  bottom: 00.0,
                  child: (_isFBBannerAdLoaded)? Flexible(
                    child: Align(
                      alignment: Alignment(0, 1.0),
                      child: bannerFB,
                    ),
                    fit: FlexFit.tight,
                    flex: 3,
                  ):bannerGoogle,
                )
              ],
            );
    },
    future: loadCategories(),
  );
}
AdmobBanner  bannerGoogle= AdmobBanner(
adUnitId: getBannerAdUnitId(),
adSize: AdmobBannerSize.FULL_BANNER,
);



Widget secondLevelWidget() {
  return FutureBuilder(
    builder: (context, projectSnap) {
      return false
          ? Center(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                      child: new Center(
                          child: Text(
                        "Do you want to download this file?",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ))),
                  new Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new FlatButton(
                          onPressed: () {},
                          child: new Text('No'),
                        ),
                        new FlatButton(
                          onPressed: () {},
                          child: new Text('Yes'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : (projectSnap.data.isCategory
              ? Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      bottom: 60.0,
                      child: GridView.builder(
                        itemCount: projectSnap.data.isCategory
                            ? projectSnap.data.categories.length
                            : projectSnap.data.collections.length,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          // Categories categories = projectSnap.data.categories[index];
                          // Collections collections = projectSnap.data.collections[index];

                          Categories categories =
                              projectSnap.data.categories[index];
                          bool isImageLive = false;
                          String localPath =
                              "assets/android_asset/apps/offline/image.png";
                          if (categories.iconUrl != null) {
                            if (categories.iconUrl
                                .toString()
                                .contains("http")) {
                              isImageLive = true;
                            } else {
                              if (categories.iconUrl
                                  .toString()
                                  .contains("assets:")) {
                                localPath = categories.iconUrl
                                    .toString()
                                    .replaceRange(0, 8, '');
                                localPath = "assets/android_asset" + localPath;
                              }
                            }
                          } else {
                            localPath =
                                "assets/android_asset/apps/offline/image.png";
                          }

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: InkResponse(
                                onTap: () {
                                  handleInsAddEvent();
                                  selectedSecondayCatID =
                                      projectSnap.data.categories[index].id;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondActivity(
                                            text: projectSnap
                                                .data.categories[index].title)),
                                  );
                                },
                                child: new Center(
                                  child: new Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: isImageLive
                                            ? Image.network(categories.iconUrl,
                                                width: 120,
                                                height: 120,
                                                fit: BoxFit.fill)
                                            : Image.asset(localPath,
                                                width: 120,
                                                height: 120,
                                                fit: BoxFit.fill),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 8, 8, 0),
                                          child: Text(
                                              projectSnap
                                                  .data.categories[index].title,
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ],
                                  ),
                                )),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 00.0,
                      child: (bannerFB!=null)?bannerFB:bannerGoogle,
                    )
                  ],
                )
              : (!(projectSnap.data.collections[0].description
                      .toString()
<<<<<<< Updated upstream
                      .contains("page:=>"))
                  ? (projectSnap.data.collections[0].description
                          .toString()
                          .contains("<!DOCTYPE html>")
                      ? (projectSnap.data.collections[0].answer != null
                          ? (new Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0.0,
                                  left: 15.0,
                                  right: 15.0,
                                  bottom: 100.0,
                                  child: SingleChildScrollView(
                                    child: Html(
                                      data: prepareHTMLData(projectSnap
                                          .data.collections[0].description
                                          .toString()),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: new Column(
                                      children: <Widget>[
                                        FutureBuilder(
                                          builder: (context, projectSnap_bool) {
                                            return (!didPassedFirstTest)
                                                ? Center(
                                                    child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 10, 10, 10),
                                                    child: Text(
                                                      "Answer file not downloaded",
                                                      style: TextStyle(
                                                          color: Colors.pink,
                                                          fontSize: 17),
                                                    ),
                                                  ))
                                                : FutureBuilder(
                                                    builder: (context,
                                                        projectSnap_) {
                                                      return isDownloading
                                                          ? Center(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                    child: Text(
                                                                      "Please wait while your file downlaods",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .pink,
                                                                          fontSize:
                                                                              17),
                                                                    ),
                                                                  ),
                                                                  CircularProgressIndicator(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .amber)
                                                                ],
                                                              ),
                                                            )
                                                          : AudioApp(
                                                              serverIP:
                                                                  projectSnap_
                                                                      .data
                                                                      .toString());
                                                    },
                                                    future: createFileAnyHow(
                                                        projectSnap
                                                            .data
                                                            .collections[0]
                                                            .answer
                                                            .toString(),
                                                        context),
                                                  );
                                          },
                                          future: checkIfFileAvailable(
                                              projectSnap
                                                  .data.collections[0].answer
                                                  .toString(),
                                              context),
                                        ),
                                        AdmobBanner(
                                          adUnitId: getBannerAdUnitId(),
                                          adSize: AdmobBannerSize.FULL_BANNER,
                                        )
                                      ],
                                    )),
                              ],
                            ))
                          : new Scaffold(
=======
                      .contains("======="))
                  ? searchAndReturnStaticFile(
                      projectSnap.data.collections[0].description.toString())
                  : (projectSnap.data.collections[0].description
                          .toString()
                          .contains("<!DOCTYPE html>")
                      ? (projectSnap.data.collections[0].answer != null
                          ? (new Scaffold(
>>>>>>> Stashed changes
                              body: new SingleChildScrollView(
                              child: Html(
                                data: prepareHTMLData(projectSnap
                                    .data.collections[0].description
                                    .toString()),
                              ),
                            )))
<<<<<<< Updated upstream
                      : (projectSnap.data.collections[0].description
                              .toString()
                              .endsWith(".pdf")
                          ? (Stack(
                              children: <Widget>[
                                Positioned(
                                  bottom: 00.0,
                                  child: AdmobBanner(
                                    adUnitId: getBannerAdUnitId(),
                                    adSize: AdmobBannerSize.FULL_BANNER,
                                  ),
                                ),
                                Positioned(
                                  top: 00.0,
                                  left: 10.0,
                                  right: 10.0,
                                  bottom: 60.0,
                                  child: FutureBuilder(
                                    builder: (context, projectSnap_bool) {
                                      return (!didPassedFirstTest)
                                          ? Center(
                                              child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              child: Text(
                                                "File is not downloaded.Please grant download permission",
                                                style: TextStyle(
                                                    color: Colors.pink,
                                                    fontSize: 17),
                                              ),
                                            ))
                                          : FutureBuilder(
                                              builder: (context, projectSnap_) {
                                                return isDownloading //check is the file needs to to be downloaded
                                                    ? Center(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                              child: Text(
                                                                "Please wait while your file downlaods",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .pink,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ),
                                                            CircularProgressIndicator(
                                                                backgroundColor:
                                                                    Colors
                                                                        .amber)
                                                          ],
                                                        ),
                                                      )
                                                    : PDFViewerScaffold(
                                                        path:
                                                            projectSnap_.data);
                                              },
                                              future: createFileAnyHow(
                                                  projectSnap
                                                      .data
                                                      .collections[0]
                                                      .description
                                                      .toString(),
                                                  context),
                                            );
                                    },
                                    future: checkIfFileAvailable(
                                        projectSnap
                                            .data.collections[0].description
                                            .toString(),
                                        context),
                                  ),
                                )
                              ],
                            ))
                          : (projectSnap.data.collections[0].description
                                  .toString()
                                  .endsWith(".mp3")
                              ? (Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 0.0,
                                      right: 0.0,
                                      bottom: 30.0,
                                      child: FutureBuilder(
                                        builder: (context, projectSnap_bool) {
                                          return (!didPassedFirstTest)
                                              ? Center(
                                                  child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                                  child: Text(
                                                    "File is not downloaded.Please grant download permission",
                                                    style: TextStyle(
                                                        color: Colors.pink,
                                                        fontSize: 17),
                                                  ),
                                                ))
                                              : FutureBuilder(
                                                  builder:
                                                      (context, projectSnap_) {
                                                    return isDownloading
                                                        ? Center(
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child: Text(
                                                                    "Please wait while your file downlaods",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .pink,
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                ),
                                                                CircularProgressIndicator(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .amber)
                                                              ],
                                                            ),
                                                          )
                                                        : AudioApp(
                                                            serverIP:
                                                                projectSnap_
                                                                    .data
                                                                    .toString());
                                                  },
                                                  future: createFileAnyHow(
                                                      projectSnap
                                                          .data
                                                          .collections[0]
                                                          .description
                                                          .toString(),
                                                      context),
                                                );
                                        },
                                        future: checkIfFileAvailable(
                                            projectSnap
                                                .data.collections[0].description
                                                .toString(),
                                            context),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: AdmobBanner(
                                        adUnitId: getBannerAdUnitId(),
                                        adSize:
                                            AdmobBannerSize.MEDIUM_RECTANGLE,
                                      ),
                                    )
                                  ],
                                ))
                              : createCustomLayout(
                                  projectSnap.data.collections[0].description
                                      .toString(),
                                  projectSnap.data.collections[0].answer,
                                  context))))
                  : searchAndReturnStaticFile(projectSnap.data.collections[0].description
          .toString())));
=======
                          : new Scaffold(
                              body: new SingleChildScrollView(
                              child: Html(
                                data: prepareHTMLData(projectSnap
                                    .data.collections[0].description
                                    .toString()),
                              ),
                            )))
                      : (projectSnap.data.collections[0].description
                              .toString()
                              .contains("openlink=>")
                          ? (openlikinent(projectSnap
                              .data.collections[0].description
                              .toString()))
                          : Text(projectSnap.data.collections[0].description
                              .toString())))));
>>>>>>> Stashed changes
    },
    future: loadSecondaryCategories(),
  );
}

<<<<<<< Updated upstream
Widget  searchAndReturnStaticFile(String string) {
  String file = string.substring(7,(string.length));
=======
Widget openlikinent(String string) {
  launch(string.replaceAll("openlink=>", ""));

  return Text("Link is opening in browser");
}

Widget searchAndReturnStaticFile(String string) {
  String file = string.replaceAll("=", "");
>>>>>>> Stashed changes

  if(file.contains("pageOne")){
    return pageOne;
  }else return Text("File is not avilable on asset");
}

Widget createCustomLayout(String string, answer, BuildContext context) {
  var commentWidgets = List<Widget>();
  //List<Widget> widgetList = [];
  List<CustomBodyModel> allObjecs = [];
  final jsonResponse = json.decode(string);
  for (Map i in jsonResponse) {
    if (CustomBodyModel.fromJson(i).type.contains("Text")) {
      commentWidgets.add(new Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text(CustomBodyModel.fromJson(i).body),
      ));
    } else if (CustomBodyModel.fromJson(i).type.contains("img")) {
      commentWidgets.add(new Padding(
        padding: EdgeInsets.fromLTRB(00, 00, 00, 00),
        child:
            Image.network(CustomBodyModel.fromJson(i).body, fit: BoxFit.fill),
      ));
    }
  }
//  if (answer != null) {
//    String audioFile = answer.toString();
//    Widget audioPlayer = createAnAudioView(audioFile, context);
//    commentWidgets.add(audioPlayer);
//  }

  SingleChildScrollView s = new SingleChildScrollView(
    child: Column(
      children: commentWidgets,
    ),
  );

  return s;
}

<<<<<<< Updated upstream
Widget createAnAudioView(String audioFile, BuildContext context) {
  return FutureBuilder(
    builder: (context, projectSnap_bool) {
      return (!didPassedFirstTest)
          ? Center(
              child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                "Answer file not downloaded",
                style: TextStyle(color: Colors.pink, fontSize: 17),
              ),
            ))
          : FutureBuilder(
              builder: (context, projectSnap_) {
                return isDownloading
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                "Please wait while your file downlaods",
                                style:
                                    TextStyle(color: Colors.pink, fontSize: 17),
                              ),
                            ),
                            CircularProgressIndicator(
                                backgroundColor: Colors.amber)
                          ],
                        ),
                      )
                    : AudioApp(serverIP: projectSnap_.data.toString());
              },
              future: createFileAnyHow(audioFile, context),
            );
    },
    future: checkIfFileAvailable(audioFile, context),
  );
}
=======
//Widget createAnAudioView(String audioFile, BuildContext context) {
//  return FutureBuilder(
//    builder: (context, projectSnap_bool) {
//      return (!didPassedFirstTest)
//          ? Center(
//              child: Padding(
//              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//              child: Text(
//                "Answer file not downloaded",
//                style: TextStyle(color: Colors.pink, fontSize: 17),
//              ),
//            ))
//          : FutureBuilder(
//              builder: (context, projectSnap_) {
//                return isDownloading
//                    ? Center(
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                              child: Text(
//                                "Please wait while your file downlaods",
//                                style:
//                                    TextStyle(color: Colors.pink, fontSize: 17),
//                              ),
//                            ),
//                            CircularProgressIndicator(
//                                backgroundColor: Colors.amber)
//                          ],
//                        ),
//                      )
//                    : AudioApp(serverIP: projectSnap_.data.toString());
//              },
//              future: checkIfFileAvailableNoDialog(audioFile, context),
//            );
//    },
//    future: checkIfFileAvailable(audioFile, context),
//  );
//}
>>>>>>> Stashed changes

String prepareHTMLData(String string) {
  return string.replaceAll("\n", "");
}

Future<void> handleInsAddEvent() async {
  CLICK_COUNTER++;

  if (true) {
    interstitialAd.load();
<<<<<<< Updated upstream
    if (await interstitialAd.isLoaded) {
      interstitialAd.show();
    } else {
      //  showThisToast("not loaded");
=======
    if (_isInterstitialAdLoaded == true) {
      _showInterstitialAd();
      showThisToast("it should show now fb");
    } else {
      if (await interstitialAd.isLoaded) interstitialAd.show();
      showThisToast("it should show now gg");
>>>>>>> Stashed changes
    }
  } else {}
}

//second page
class FileDownloadActivity extends StatelessWidget {
  final String text;

  FileDownloadActivity({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(text),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                  child: new Center(
                      child: Text(
                    "Do you want to download this file?",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ))),
              new Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new FlatButton(
                      onPressed: () {},
                      child: new Text('No'),
                    ),
                    new FlatButton(
                      onPressed: () {},
                      child: new Text('Yes'),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

//second page
class SecondActivity extends StatelessWidget {
  final String text;

  SecondActivity({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    didPassedFirstTest = false;
    // showThisToast("This widget is hited");
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: secondLevelWidget(),
    );
  }
}

Widget openFileInstantly(Collections collection, BuildContext context) {
  String ht = collection.description;
  if (ht.contains("<!DOCTYPE html>")) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HtmlViwer(text: ht)),
    );
  }
}

Widget myDrawer() {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: new Center(
            child: Text(
              'App Name',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.pink,
          ),
        ),
        ListTile(
          leading: Icon(Icons.description),
          title: Text('Facebook'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.description),
          title: Text('Youtube'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
      ],
    ),
  );
}

class SpActtivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
<<<<<<< Updated upstream
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: new Text('Yes'),
                ),
=======
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (_isFBBannerAdLoaded)? Flexible(
                      child: Align(
                        alignment: Alignment(0, 1.0),
                        child: bannerFB,
                      ),
                      fit: FlexFit.tight,
                      flex: 3,
                    ):bannerGoogle,
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: new Text('No'),
                          ),
                          new FlatButton(
                            onPressed: () {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            child: new Text('Yes'),
                          ),
                        ],
                      ),
                    )
                  ],
                )
>>>>>>> Stashed changes
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Container(color: Colors.white, child: SplashScreen(context)));
  }
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      drawer: myDrawer(),
      body: projectWidget(),
    );
  }
}

class PDFScreen extends StatelessWidget {
  String pathPDF = "";

  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: downlaodAndShowPDF(pathPDF, context),
    );
  }
}

class myRetrivedData {
  List<Categories> categories;
  List<Collections> collections;
  bool isCategory;

  myRetrivedData({this.categories, this.collections, this.isCategory});
}

Future<String> copyAsset(String path) async {
  isPDFLoading = true;
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final filename = path.substring(path.lastIndexOf("/") + 1);

  File tempFile = File('$tempPath' + filename);
  ByteData bd = await rootBundle.load("assets" + path);
  await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
  isPDFLoading = false;
  return tempFile.path;
}

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544~1458002511';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544~3347511713';
  }
  return null;
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}
//add helpler start

const String testDevice = 'YOUR_DEVICE_ID';

//add helper ends

//html vier start
class HtmlViwer extends StatelessWidget {
  final String text;

  HtmlViwer({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Description"),
          ),
          body: SingleChildScrollView(child: Text("ok")
//            child: Html(
//              data: text,
//            ),
              ),
        ));
  }
}
//html ends

Future<String> createFileOfPdfUrl(String url_, BuildContext c) async {
  isPDFLoading = true;
  final filename = url_.substring(url_.lastIndexOf("/") + 1);
  final dir = await getApplicationDocumentsDirectory();
  final file = File(dir.path + "/" + filename);
  if (await file.exists()) {
    isPDFLoading = false;
    return dir.path + "/" + filename;
  } else {
    //  showThisToast("True found");
    final url = url_;
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);

    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    isPDFLoading = false;
    return file.path;
  }
}

//void downlaodAndNavigateAudio(String url_, BuildContext c) async {
//  isPDFLoading = true;
//  final filename = url_.substring(url_.lastIndexOf("/") + 1);
//  final dir = await getApplicationDocumentsDirectory();
//  final file = File(dir.path + "/" + filename);
//  if (await file.exists()) {
//    isPDFLoading = false;
//    liveMusicLink = dir.path + "/" + filename;
//    musicLocalFilePath = dir.path + "/" + filename;
//    Navigator.push(
//      c,
//      MaterialPageRoute(
//          // builder: (context) => ExampleApp()),
//          builder: (context) => AudioApp()),
//    );
//  } else {
//    //  showThisToast("True found");
//    final url = url_;
//    final filename = url.substring(url.lastIndexOf("/") + 1);
//    var request = await HttpClient().getUrl(Uri.parse(url));
//    var response = await request.close();
//    var bytes = await consolidateHttpClientResponseBytes(response);
//
//    String dir = (await getApplicationDocumentsDirectory()).path;
//    File file = new File('$dir/$filename');
//    await file.writeAsBytes(bytes);
//    isPDFLoading = false;
//    liveMusicLink = file.path;
//    musicLocalFilePath = file.path;
//    Navigator.push(
//      c,
//      MaterialPageRoute(
//          // builder: (context) => ExampleApp()),
//          builder: (context) => AudioApp()),
//    );
//  }
//}

Future<bool> askBoolean(context, String url_) async {
  bool status = false;
  status = await showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text('Are you sure?'),
      content: new Text('Do you want to download the file?'),
      actions: <Widget>[
        new FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text('No'),
        ),
        new FlatButton(
          onPressed: () {
            status = true;
            //  showThisToast("True found 2");
            Navigator.pop(context, true);
          },
          child: new Text('Yes'),
        ),
      ],
    ),
  );
  return status;
}

//music codes
typedef void OnError(Exception exception);

bool isDownloading = true;
String downloadedFilePath;
enum PlayerState { stopped, playing, paused }

<<<<<<< Updated upstream
class AudioApp extends StatefulWidget {
  final String serverIP;

  const AudioApp({Key key, this.serverIP}) : super(key: key);

  @override
  _AudioAppState createState() => _AudioAppState();
}

class _AudioAppState extends State<AudioApp> {
  Duration duration;
  Duration position;

  AudioPlayer audioPlayer;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;

  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == AudioPlayerState.PLAYING) {
        setState(() => duration = audioPlayer.duration);
      } else if (s == AudioPlayerState.STOPPED) {
        onComplete();
        setState(() {
          position = duration;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(widget.serverIP);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future _playLocal() async {
    await audioPlayer.play(musicLocalFilePath, isLocal: true);
    setState(() => playerState = PlayerState.playing);
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = Duration();
    });
  }

  Future mute(bool muted) async {
    await audioPlayer.mute(muted);
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
    Uint8List bytes;
    try {
      bytes = await readBytes(url);
    } on ClientException {
      rethrow;
    }
    return bytes;
  }

  Future _loadFile() async {
    final bytes = await _loadFileBytes(liveMusicLink,
        onError: (Exception exception) =>
            print('_loadFile => exception $exception'));

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
    if (await file.exists())
      setState(() {
        musicLocalFilePath = file.path;
      });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(child: _buildPlayer());
  }

  Widget _buildPlayer() => Container(
        child: Column(
          children: [
            if (duration != null)
              Container(
                height: 35,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 00.0,
                      right: 00.0,
                      child: Slider(
                          value: position?.inMilliseconds?.toDouble() ?? 0.0,
                          onChanged: (double value) {
                            return audioPlayer
                                .seek((value / 1000).roundToDouble());
                          },
                          min: 0.0,
                          max: duration.inMilliseconds.toDouble()),
                    )
                  ],
                ),
              ),

            Row(mainAxisSize: MainAxisSize.min, children: [
              if (duration != null)
                Text(
                  position != null
                      ? "${positionText ?? ''}"
                      : duration != null ? durationText : '',
                  style: TextStyle(fontSize: 11.0),
                ),
              IconButton(
                onPressed: isPlaying ? null : () => play(),
                iconSize: 32.0,
                icon: Icon(Icons.play_arrow),
                color: Colors.pink,
              ),
              IconButton(
                onPressed: isPlaying ? () => pause() : null,
                iconSize: 32.0,
                icon: Icon(Icons.pause),
                color: Colors.pink,
              ),
              IconButton(
                onPressed: isPlaying || isPaused ? () => stop() : null,
                iconSize: 32.0,
                icon: Icon(Icons.stop),
                color: Colors.pink,
              ),
              if (duration != null)
                Text(
                  position != null
                      ? "${durationText ?? ''}"
                      : duration != null ? durationText : '',
                  style: TextStyle(fontSize: 11.0),
                ),
            ]),

//            if (position != null) _buildMuteButtons(),
            // if (position != null) _buildProgressView()
          ],
        ),
      );

  Row _buildProgressView() => Row(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator(
            value: position != null && position.inMilliseconds > 0
                ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
                    (duration?.inMilliseconds?.toDouble() ?? 0.0)
                : 0.0,
            valueColor: AlwaysStoppedAnimation(Colors.cyan),
            backgroundColor: Colors.grey.shade400,
          ),
        ),
        Text(
          position != null
              ? "${positionText ?? ''} / ${durationText ?? ''}"
              : duration != null ? durationText : '',
          style: TextStyle(fontSize: 24.0),
        )
      ]);
=======
//class AudioApp extends StatefulWidget {
//  final String serverIP;
//
//  const AudioApp({Key key, this.serverIP}) : super(key: key);
//
//  @override
//  _AudioAppState createState() => _AudioAppState();
//}
>>>>>>> Stashed changes

//class _AudioAppState extends State<AudioApp> {
//  Duration duration;
//  Duration position;
//
//  AudioPlayer audioPlayer;
//
//  PlayerState playerState = PlayerState.stopped;
//
//  get isPlaying => playerState == PlayerState.playing;
//
//  get isPaused => playerState == PlayerState.paused;
//
//  get durationText =>
//      duration != null ? duration.toString().split('.').first : '';
//
//  get positionText =>
//      position != null ? position.toString().split('.').first : '';
//
//  bool isMuted = false;
//
//  StreamSubscription _positionSubscription;
//  StreamSubscription _audioPlayerStateSubscription;
//
//  @override
//  void initState() {
//    super.initState();
//    initAudioPlayer();
//  }
//
//  @override
//  void dispose() {
//    _positionSubscription.cancel();
//    _audioPlayerStateSubscription.cancel();
//    audioPlayer.stop();
//    super.dispose();
//  }
//
//  void initAudioPlayer() {
//    audioPlayer = AudioPlayer();
//    _positionSubscription = audioPlayer.onAudioPositionChanged
//        .listen((p) => setState(() => position = p));
//    _audioPlayerStateSubscription =
//        audioPlayer.onPlayerStateChanged.listen((s) {
//      if (s == AudioPlayerState.PLAYING) {
//        setState(() => duration = audioPlayer.duration);
//      } else if (s == AudioPlayerState.STOPPED) {
//        onComplete();
//        setState(() {
//          position = duration;
//        });
//      }
//    }, onError: (msg) {
//      setState(() {
//        playerState = PlayerState.stopped;
//        duration = Duration(seconds: 0);
//        position = Duration(seconds: 0);
//      });
//    });
//  }
//
//  Future play() async {
//    await audioPlayer.play(widget.serverIP);
//    setState(() {
//      playerState = PlayerState.playing;
//    });
//  }
//
//  Future _playLocal() async {
//    await audioPlayer.play(musicLocalFilePath, isLocal: true);
//    setState(() => playerState = PlayerState.playing);
//  }
//
//  Future pause() async {
//    await audioPlayer.pause();
//    setState(() => playerState = PlayerState.paused);
//  }
//
//  Future stop() async {
//    await audioPlayer.stop();
//    setState(() {
//      playerState = PlayerState.stopped;
//      position = Duration();
//    });
//  }
//
//  Future mute(bool muted) async {
//    await audioPlayer.mute(muted);
//    setState(() {
//      isMuted = muted;
//    });
//  }
//
//  void onComplete() {
//    setState(() => playerState = PlayerState.stopped);
//  }
//
//  Future<Uint8List> _loadFileBytes(String url, {OnError onError}) async {
//    Uint8List bytes;
//    try {
//      bytes = await readBytes(url);
//    } on ClientException {
//      rethrow;
//    }
//    return bytes;
//  }
//
//  Future _loadFile() async {
//    final bytes = await _loadFileBytes(liveMusicLink,
//        onError: (Exception exception) =>
//            print('_loadFile => exception $exception'));
//
//    final dir = await getApplicationDocumentsDirectory();
//    final file = File('${dir.path}/audio.mp3');
//
//    await file.writeAsBytes(bytes);
//    if (await file.exists())
//      setState(() {
//        musicLocalFilePath = file.path;
//      });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final textTheme = Theme.of(context).textTheme;
//    return Material(child: _buildPlayer());
//  }
//
//  Widget _buildPlayer() => Container(
//        child: Column(
//          children: [
//            if (duration != null)
//              Container(
//                height: 45,
//                child: Stack(
//                  children: <Widget>[
//                    Positioned(
//                      left: 00.0,
//                      right: 00.0,
//                      child: Slider(
//                          value: position?.inMilliseconds?.toDouble() ?? 0.0,
//                          onChanged: (double value) {
//                            return audioPlayer
//                                .seek((value / 1000).roundToDouble());
//                          },
//                          min: 0.0,
//                          max: duration.inMilliseconds.toDouble()),
//                    )
//                  ],
//                ),
//              ),
//
//            Row(mainAxisSize: MainAxisSize.min, children: [
//              if (duration != null)
//                Text(
//                  position != null
//                      ? "${positionText ?? ''}"
//                      : duration != null ? durationText : '',
//                  style: TextStyle(fontSize: 13.0),
//                ),
//              IconButton(
//                onPressed: isPlaying ? null : () => play(),
//                iconSize: 48.0,
//                icon: Icon(Icons.play_arrow),
//                color: Colors.pink,
//              ),
//              IconButton(
//                onPressed: isPlaying ? () => pause() : null,
//                iconSize: 48.0,
//                icon: Icon(Icons.pause),
//                color: Colors.pink,
//              ),
//              IconButton(
//                onPressed: isPlaying || isPaused ? () => stop() : null,
//                iconSize: 48.0,
//                icon: Icon(Icons.stop),
//                color: Colors.pink,
//              ),
//              if (duration != null)
//                Text(
//                  position != null
//                      ? "${durationText ?? ''}"
//                      : duration != null ? durationText : '',
//                  style: TextStyle(fontSize: 13.0),
//                ),
//            ]),
//
////            if (position != null) _buildMuteButtons(),
//            // if (position != null) _buildProgressView()
//          ],
//        ),
//      );
//
//  Row _buildProgressView() => Row(mainAxisSize: MainAxisSize.min, children: [
//        Padding(
//          padding: EdgeInsets.all(12.0),
//          child: CircularProgressIndicator(
//            value: position != null && position.inMilliseconds > 0
//                ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
//                    (duration?.inMilliseconds?.toDouble() ?? 0.0)
//                : 0.0,
//            valueColor: AlwaysStoppedAnimation(Colors.cyan),
//            backgroundColor: Colors.grey.shade400,
//          ),
//        ),
//        Text(
//          position != null
//              ? "${positionText ?? ''} / ${durationText ?? ''}"
//              : duration != null ? durationText : '',
//          style: TextStyle(fontSize: 24.0),
//        )
//      ]);
//
//  Row _buildMuteButtons() {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        if (!isMuted)
//          FlatButton.icon(
//            onPressed: () => mute(true),
//            icon: Icon(
//              Icons.headset_off,
//              color: Colors.cyan,
//            ),
//            label: Text('Mute', style: TextStyle(color: Colors.cyan)),
//          ),
//        if (isMuted)
//          FlatButton.icon(
//            onPressed: () => mute(false),
//            icon: Icon(Icons.headset, color: Colors.cyan),
//            label: Text('Unmute', style: TextStyle(color: Colors.cyan)),
//          ),
//      ],
//    );
//  }
//}

Future<String> createFileAnyHow(String url_, BuildContext c) async {
  if (url_.contains("file:///")) {
    isDownloading = true;

    url_ = url_.replaceRange(0, 7, '');
    //showThisToast(url_);
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final filename = url_.substring(url_.lastIndexOf("/") + 1);

    File tempFile = File('$tempPath' + filename);
    ByteData bd = await rootBundle.load("assets" + url_);
    await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
    isDownloading = false;
    liveMusicLink = tempFile.path;
    musicLocalFilePath = tempFile.path;
    // showThisToast(tempFile.path);
    // doINeedDownload = false;
    doIHaveDownloadPermission = true;

    return tempFile.path;
  } else {
    isDownloading = true;
    final filename = url_.substring(url_.lastIndexOf("/") + 1);
    final dir = await getApplicationDocumentsDirectory();
    final file = File(dir.path + "/" + filename);

    if (await file.exists()) {
      isDownloading = false;
      // showThisToast("exixts" + "\n" + url_);
      //showThisToast(dir.path + "/" + filename);
      //  doINeedDownload = false;
      doIHaveDownloadPermission = true;
      return dir.path + "/" + filename;
    } else {
      // showThisToast("File Downnload started");
      final url = url_;
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);

      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = new File('$dir/$filename');
      await file.writeAsBytes(bytes);
      isDownloading = false;
      liveMusicLink = file.path;
      musicLocalFilePath = file.path;
      //showThisToast(file.path);
      //  doINeedDownload = false;
      doIHaveDownloadPermission = true;
      return file.path;
    }
  }
}

bool getBool(String url_) {
  return false;
}

Future<bool> checkIfFileAvailable(String url_, BuildContext c) async {
  if (url_.contains("file:///")) {
    //  showThisToast("File was in local");
    doIHaveDownloadPermission = true;
    doINeedDownload = false;
    didPassedFirstTest = true;
    return true;
  } else {
    final filename = url_.substring(url_.lastIndexOf("/") + 1);
    final dir = await getApplicationDocumentsDirectory();
    final file = File(dir.path + "/" + filename);

    if (await file.exists()) {
      didPassedFirstTest = true;
      // showThisToast("exixts" + "\n" + url_);
      //showThisToast(dir.path + "/" + filename);
      //  showThisToast("File previously downloaded");
      doIHaveDownloadPermission = true;
      doINeedDownload = false;
      return true;
    } else {
      // showThisToast("Need to download");
      //doIHaveDownloadPermission = false;
      doINeedDownload = true;

      didPassedFirstTest = false;

      bool gg = (await showDialog(
            barrierDismissible: false,
            context: c,
            builder: (context) => new AlertDialog(
              title: new Text('Download required'),
              content: new Text('Do you want to Download the file'),
              actions: <Widget>[
<<<<<<< Updated upstream
                new FlatButton(
                  onPressed: () {
                    doIHaveDownloadPermission = false;
                    Navigator.of(context).pop(false);
                    Navigator.of(context).pop();
                    didPassedFirstTest = false;
                  },
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () {
                    doIHaveDownloadPermission = true;
                    didPassedFirstTest = true;
                    Navigator.of(context).pop(true);
                  },
                  child: new Text('Yes'),
                ),
=======
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                (bannerFB!=null)?bannerFB:bannerGoogle,
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new FlatButton(
                            onPressed: () {
                              doIHaveDownloadPermission = false;
                              Navigator.of(context).pop(false);
                              Navigator.of(context).pop();
                              didPassedFirstTest = false;
                            },
                            child: new Text('No'),
                          ),
                          new FlatButton(
                            onPressed: () {
                              doIHaveDownloadPermission = true;
                              didPassedFirstTest = true;
                              Navigator.of(context).pop(true);
                            },
                            child: new Text('Yes'),
                          ),
                        ],
                      ),
                    )
                  ],
                )
>>>>>>> Stashed changes
              ],
            ),
          )) ??
          false;
      if (gg) {
        // showThisToast("True found");
      } else {
        //  showThisToast("false found");
      }

      return gg;
    }
  }
}

Future<String> copyAsset_2(String path) async {
  showThisToast("Asset load" + "\n" + path);
  isDownloading = true;
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  final filename = path.substring(path.lastIndexOf("/") + 1);

  File tempFile = File('$tempPath' + filename);
  ByteData bd = await rootBundle.load("assets" + path);
  await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
  isDownloading = false;
  liveMusicLink = tempFile.path;
  musicLocalFilePath = tempFile.path;
  return tempFile.path;
}

Future<String> returnLocalFileName(String path) async {
  isDownloading = false;
  // showThisToast("local return" + "\n" + path);
  return path;
}


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

