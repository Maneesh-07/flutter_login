import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/core/color.dart';
import 'package:get/get.dart';


class ConnectivityService extends GetxController {
  final Connectivity _connectivity = Connectivity();

  RxBool hasInternetConnection = false.obs;
  showAlert(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {},
          child: const Text(
            'OK',
            style: TextStyle(color: backgroundcolor),
          ),
        ),
      ],
    );
  }

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      checkInternetConnection();
    });
  }

  Future<void> checkInternetConnection() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    hasInternetConnection.value = connectivityResult != ConnectivityResult.none;
  }
}
