import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.green.shade900),
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: NavigationControls(
                _controller.future), // to move the bottun to left
            foregroundColor: Colors.black,
            toolbarHeight: 70,
            centerTitle: true,
            shadowColor: Colors.white,
            elevation: 0, // remove the shadow

            title: Image.asset('assets/sanad.jpg',
                width: 120, height: 50, fit: BoxFit.cover),

            backgroundColor: Colors.white,
          ),
          body: WebView(
            gestureRecognizers: null,

            initialUrl: 'https://sanad-sandbox.mxapps.io/',
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
            // gestureNavigationEnabled: true,
            backgroundColor: Color.fromARGB(0, 218, 59, 59),
            geolocationEnabled: true, // set geolocationEnable true or not
            zoomEnabled: false,
            allowsInlineMediaPlayback: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.help_rounded),
                icon: Icon(Icons.help_outline),
                label: 'Help',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.location_on),
                icon: Icon(Icons.location_on_outlined),
                label: 'Near Me',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.lock_rounded),
                icon: Icon(Icons.lock_outline),
                label: 'Sign In',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.star_outlined),
                icon: Icon(Icons.star_outline_outlined),
                label: 'Guidelines',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.error_outlined),
                icon: Icon(Icons.error_outline),
                label: 'About',
              ),
            ],
            unselectedItemColor: Colors.blueGrey.shade300,
            selectedItemColor: Colors.green.shade600,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            iconSize: 28,
            type: BottomNavigationBarType.fixed,
          ),
        ));
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
              color: Colors.black,
              icon: Image.asset('assets/arrow.jpeg',
                  width: 25, height: 15, fit: BoxFit.cover),
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
          ],
        );
      },
    );
  }
}
