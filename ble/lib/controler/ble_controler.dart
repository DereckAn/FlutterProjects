import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  Future scan() async {
    if(await Permission.bluetoothScan.request().isGranted) {
      if(await Permission.bluetoothConnect.request().isGranted) {
        flutterBlue.startScan(timeout: const Duration(seconds: 4));
        flutterBlue.stopScan();
      }
    }
  }

  Stream<List<ScanResult>> get scanResults => flutterBlue.scanResults;
}
