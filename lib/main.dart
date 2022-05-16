// import 'package:flutter/material.dart';
// // import 'package:webviewx/webviewx.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// // import 'package:flutter_webview_pro/webview_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sanad',
//       theme: ThemeData(
//           primarySwatch: Colors.green,
//           secondaryHeaderColor: Colors.amber,
//           hoverColor: Colors.grey),
//       home: const MyHomePage(title: ''),
//     );
//   }
// }

// // Column _buildButtonColumn(Color color, IconData icon, String label) {
// //   return Column(
// //     mainAxisSize: MainAxisSize.min,
// //     mainAxisAlignment: MainAxisAlignment.center,
// //     children: [
// //       Icon(icon, color: color),
// //       Container(
// //         margin: const EdgeInsets.only(top: 8),
// //         child: Text(
// //           label,
// //           style: TextStyle(
// //             fontSize: 12,
// //             fontWeight: FontWeight.w400,
// //             color: color,
// //           ),
// //         ),
// //       ),
// //     ],
// //   );
// // }

// // late WebViewXController webviewController;

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // int _counter = 0;

//   // void _incrementCounter() {
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // Widget titleSection = Container(
//     //   padding: const EdgeInsets.all(32),
//     //   child: Row(
//     //     children: [
//     //       Expanded(
//     //         /*1*/
//     //         child: Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: [
//     //             /*2*/
//     //             Container(
//     //               padding: const EdgeInsets.only(bottom: 8),
//     //               child: const Text(
//     //                 'Oeschinen Lake Campground',
//     //                 style: TextStyle(
//     //                   fontWeight: FontWeight.bold,
//     //                 ),
//     //               ),
//     //             ),
//     //             Text(
//     //               'Kandersteg, Switzerland',
//     //               style: TextStyle(
//     //                 color: Colors.grey[500],
//     //               ),
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //       /*3*/
//     //       Icon(
//     //         Icons.star,
//     //         color: Colors.red[500],
//     //       ),
//     //       Text('$_counter'),
//     //     ],
//     //   ),
//     // );

//     // Color color = Theme.of(context).primaryColor;

//     // Widget buttonSection = Row(
//     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //   children: [
//     //     _buildButtonColumn(color, Icons.call, 'CALL'),
//     //     _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//     //     _buildButtonColumn(color, Icons.share, 'SHARE'),
//     //   ],
//     // );

//     // Widget textSection = const Padding(
//     //   padding: EdgeInsets.all(32),
//     //   child: Text(
//     //     'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
//     //     'Alps. Situated 1,578 meters above sea level, it is one of the '
//     //     'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//     //     'half-hour walk through pastures and pine forest, leads you to the '
//     //     'lake, which warms to 20 degrees Celsius in the summer. Activities '
//     //     'enjoyed here include rowing, and riding the summer toboggan run.',
//     //     softWrap: true,
//     //   ),
//     // );

//     return MaterialApp(
// //       title: 'Welcome to Flutter',
//         home: Scaffold(
//       // return Scaffold(
//       // appBar: AppBar(
//       //   title: Text(widget.title),
//       // ),
//       body: ListView(
//         children: [
//           Image.asset(
//             'images/lake.jpg',
//             width: 600,
//             height: 240,
//             fit: BoxFit.cover,
//           ),
//           const WebView(
//             initialUrl: "https://eservices.cspd.gov.jo/index-rtl.html",
//             // initialUrl: "http://localhost:8081/index.html",
//             javascriptMode: JavascriptMode.unrestricted,
//           )
//           // titleSection,
//           // buttonSection,
//           // textSection,
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'RATE',
//       //   child: const Icon(Icons.star),
//       // ),
//     ));
//   }
// }

//******************************************************************************************************************
// */

//r ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(home: WebViewExample()));

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

const String kLocalExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>

<h1>Local demo page</h1>
<p>
  This is an example page used to demonstrate how to load a local file or HTML 
  string using the <a href="https://pub.dev/packages/webview_flutter">Flutter 
  webview</a> plugin.
</p>

</body>
</html>
''';

const String kTransparentBackgroundPage = '''
  <!DOCTYPE html>
  <html>
  <head>
    <title>Transparent background test</title>
  </head>
  <style type="text/css">
    body { background: transparent; margin: 0; padding: 0; }
    #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
    #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
    p { text-align: center; }
  </style>
  <body>
    <div id="container">
      <p>Transparent background test</p>
      <div id="shape"></div>
    </div>
  </body>
  </html>
''';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Help',
  //     style: null,
  //   ),
  //   Text(
  //     'Index 1: Near Me',
  //     style: null,
  //   ),
  //   Text(
  //     'Index 2: Sign In',
  //     style: null,
  //   ),
  //   Text(
  //     'Index 3: Guidelines',
  //     style: null,
  //   ),
  //   Text(
  //     'Index 4: About',
  //     style: null,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData(
    //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     backgroundColor: Colors.grey[900],
    //     elevation: 10,
    //     selectedLabelStyle: const TextStyle(
    //         color: Color.fromARGB(255, 8, 8, 8),
    //         fontFamily: 'Montserrat',
    //         fontSize: 14.0),
    //     unselectedLabelStyle: TextStyle(
    //         color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0),
    //     selectedItemColor: const Color(0xFFA67926),
    //     unselectedItemColor: Colors.grey[600],
    //     showUnselectedLabels: true,
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 0, // remove the shadow
        // title: const Text('Flutter WebView example'),
        title: Image.asset('assets/sanad.jpg',
            width: 120, height: 50, fit: BoxFit.cover),

        backgroundColor: Colors.white,
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        // actions: <Widget>[
        //   //   NavigationControls(_controller.future),
        //   //   SampleMenu(_controller.future),

        // ],
      ),
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://eservices.cspd.gov.jo/index-rtl.html',
          // initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
          geolocationEnabled: true, // set geolocationEnable true or not
          zoomEnabled: false,
        );
      }),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Near Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline),
            label: 'Sign In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline_outlined),
            label: 'Guidelines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        // unselectedItemColor: Colors.blueGrey.shade300,
        // selectedItemColor: Colors.green.shade600,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 28,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context).copyWith(
      //       // sets the background color of the `BottomNavigationBar`
      //       canvasColor: Colors.green,
      //       // sets the active color of the `BottomNavigationBar` if `Brightness` is light
      //       primaryColor: Colors.red,
      //       textTheme: Theme.of(context).textTheme.copyWith(
      //           caption: const TextStyle(
      //               color: Colors
      //                   .yellow))), // sets the inactive color of the `BottomNavigationBar`
      //   child: BottomNavigationBar(
      //     currentIndex: _selectedIndex,
      //     unselectedItemColor: Colors.blueGrey.shade300,
      //     selectedItemColor: Colors.green.shade600,
      //     selectedFontSize: 13,
      //     unselectedFontSize: 13,
      //     iconSize: 28,
      //     onTap: _onItemTapped,
      //     type: BottomNavigationBarType.fixed,
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.help),
      //         label: 'Help',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.location_on_outlined),
      //         label: 'Near Me',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.lock_outline),
      //         label: 'Sign In',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.star_outline_outlined),
      //         label: 'Guidelines',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.error_outline),
      //         label: 'About',
      //       ),
      //     ],
      //   ),
      // ),

      // floatingActionButton: favoriteButton(),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                final String url = (await controller.data!.currentUrl())!;
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Favorited $url')),
                );
              },
              child: const Icon(Icons.favorite),
            );
          }
          return Container();
        });
  }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
  geolocation,
  doPostRequest,
  loadLocalFile,
  loadFlutterAsset,
  loadHtmlString,
  transparentBackground,
  setCookie,
}

class SampleMenu extends StatelessWidget {
  SampleMenu(this.controller);

  final Future<WebViewController> controller;
  final CookieManager cookieManager = CookieManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        return PopupMenuButton<MenuOptions>(
          key: const ValueKey<String>('ShowPopupMenu'),
          onSelected: (MenuOptions value) {
            switch (value) {
              case MenuOptions.showUserAgent:
                _onShowUserAgent(controller.data!, context);
                break;
              case MenuOptions.listCookies:
                _onListCookies(controller.data!, context);
                break;
              case MenuOptions.clearCookies:
                _onClearCookies(context);
                break;
              case MenuOptions.addToCache:
                _onAddToCache(controller.data!, context);
                break;
              case MenuOptions.listCache:
                _onListCache(controller.data!, context);
                break;
              case MenuOptions.clearCache:
                _onClearCache(controller.data!, context);
                break;
              case MenuOptions.navigationDelegate:
                _onNavigationDelegateExample(controller.data!, context);
                break;
              case MenuOptions.geolocation:
                _toLocationExample(controller.data!, context);
                break;
              case MenuOptions.doPostRequest:
                _onDoPostRequest(controller.data!, context);
                break;
              case MenuOptions.loadLocalFile:
                _onLoadLocalFileExample(controller.data!, context);
                break;
              case MenuOptions.loadFlutterAsset:
                _onLoadFlutterAssetExample(controller.data!, context);
                break;
              case MenuOptions.loadHtmlString:
                _onLoadHtmlStringExample(controller.data!, context);
                break;
              case MenuOptions.transparentBackground:
                _onTransparentBackground(controller.data!, context);
                break;
              case MenuOptions.setCookie:
                _onSetCookie(controller.data!, context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.showUserAgent,
              child: const Text('Show user agent'),
              enabled: controller.hasData,
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCookies,
              child: Text('List cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCookies,
              child: Text('Clear cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.addToCache,
              child: Text('Add to cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCache,
              child: Text('List cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCache,
              child: Text('Clear cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.navigationDelegate,
              child: Text('Navigation Delegate example'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.geolocation,
              child: Text('Navigation Geolocation example'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.doPostRequest,
              child: Text('Post Request'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.loadHtmlString,
              child: Text('Load HTML string'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.loadLocalFile,
              child: Text('Load local file'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.loadFlutterAsset,
              child: Text('Load Flutter Asset'),
            ),
            const PopupMenuItem<MenuOptions>(
              key: ValueKey<String>('ShowTransparentBackgroundExample'),
              value: MenuOptions.transparentBackground,
              child: Text('Transparent background example'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.setCookie,
              child: Text('Set cookie'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onShowUserAgent(
      WebViewController controller, BuildContext context) async {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    await controller.runJavascript(
        'Toaster.postMessage("User Agent: " + navigator.userAgent);');
  }

  Future<void> _onListCookies(
      WebViewController controller, BuildContext context) async {
    final String cookies =
        await controller.runJavascriptReturningResult('document.cookie');
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Cookies:'),
          _getCookieList(cookies),
        ],
      ),
    ));
  }

  Future<void> _onAddToCache(
      WebViewController controller, BuildContext context) async {
    await controller.runJavascript(
        'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";');
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(const SnackBar(
      content: Text('Added a test entry to cache.'),
    ));
  }

  Future<void> _onListCache(
      WebViewController controller, BuildContext context) async {
    await controller.runJavascript('caches.keys()'
        '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
        '.then((caches) => Toaster.postMessage(caches))');
  }

  Future<void> _onClearCache(
      WebViewController controller, BuildContext context) async {
    await controller.clearCache();
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(const SnackBar(
      content: Text('Cache cleared.'),
    ));
  }

  Future<void> _onClearCookies(BuildContext context) async {
    final bool hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There are no cookies.';
    }
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<void> _onNavigationDelegateExample(
      WebViewController controller, BuildContext context) async {
    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  Future<void> _toLocationExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadUrl('https://amap.com/dir');
  }

  Future<void> _onSetCookie(
      WebViewController controller, BuildContext context) async {
    await CookieManager().setCookie(
      const WebViewCookie(
          name: 'foo', value: 'bar', domain: 'httpbin.org', path: '/anything'),
    );
    await controller.loadUrl('https://httpbin.org/anything');
  }

  Future<void> _onDoPostRequest(
      WebViewController controller, BuildContext context) async {
    final WebViewRequest request = WebViewRequest(
      uri: Uri.parse('https://httpbin.org/post'),
      method: WebViewRequestMethod.post,
      headers: <String, String>{'foo': 'bar', 'Content-Type': 'text/plain'},
      body: Uint8List.fromList('Test Body'.codeUnits),
    );
    await controller.loadRequest(request);
  }

  Future<void> _onLoadLocalFileExample(
      WebViewController controller, BuildContext context) async {
    final String pathToIndex = await _prepareLocalFile();

    await controller.loadFile(pathToIndex);
  }

  Future<void> _onLoadFlutterAssetExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadFlutterAsset('assets/www/index.html');
  }

  Future<void> _onLoadHtmlStringExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadHtmlString(kLocalExamplePage);
  }

  Future<void> _onTransparentBackground(
      WebViewController controller, BuildContext context) async {
    await controller.loadHtmlString(kTransparentBackgroundPage);
  }

  Widget _getCookieList(String cookies) {
    if (cookies == null || cookies == '""') {
      return Container();
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets =
        cookieList.map((String cookie) => Text(cookie));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: cookieWidgets.toList(),
    );
  }

  static Future<String> _prepareLocalFile() async {
    final String tmpDir = (await getTemporaryDirectory()).path;
    final File indexFile = File(
        <String>{tmpDir, 'www', 'index.html'}.join(Platform.pathSeparator));

    await indexFile.create(recursive: true);
    await indexFile.writeAsString(kLocalExamplePage);

    return indexFile.path;
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController? controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller!.canGoBack()) {
                        await controller.goBack();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text('No back history item')),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller!.canGoForward()) {
                        await controller.goForward();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('No forward history item')),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller!.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}
