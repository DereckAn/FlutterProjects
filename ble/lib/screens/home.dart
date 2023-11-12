import 'package:ble/controler/ble_controler.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ble/ble_controller.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLE SCANNER"),
        centerTitle: true,
      ),
      body: GetBuilder<BleController>(
        init: BleController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                StreamBuilder<List<ScanResult>>(
                    stream: controller.scanResults,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data![index];
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  title: Text(data.device.name),
                                  subtitle: Text(data.device.id.id),
                                  trailing: Text(data.rssi.toString()),
                                ),
                              );
                            });
                      }else{
                          return Center(child: Text("No Device Found"),);
                      }
                    }),
                ElevatedButton(onPressed: () => controller.scan(), child: Text("Scan")),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}