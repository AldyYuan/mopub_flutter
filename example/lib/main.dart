import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopub_flutter/mopub.dart';
import 'package:mopub_flutter/mopub_banner.dart';
import 'package:mopub_flutter/mopub_interstitial.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MoPubInterstitialAd interstitialAd;

  @override
  void initState() {
    super.initState();
    try {
      MoPub.init('b195f8dd8ded45fe847ad89ed1d016da', testMode: true).then((_) {
        _loadInterstitialAd();
      });
    } on PlatformException {}
  }

  void _loadInterstitialAd() {
    interstitialAd = MoPubInterstitialAd(
      '24534e1901884e398f1253216226017e',
      (result, args) {},
      reloadOnClosed: true,
    );
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MoPub SDK Sample'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async => await interstitialAd.load(),
                  child: Text('Load interstitial'),
                ),
                ElevatedButton(
                  onPressed: () async => await interstitialAd.show(),
                  child: Text('Show interstitial'),
                ),
              ],
            ),
            MoPubBannerAd(
              adUnitId: 'b195f8dd8ded45fe847ad89ed1d016da',
              bannerSize: BannerSize.STANDARD,
              keepAlive: true,
              listener: (result, dynamic) {},
            ),
          ],
        ),
      ),
    );
  }
}
