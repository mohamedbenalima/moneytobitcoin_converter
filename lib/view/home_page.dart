import 'dart:ffi';

import 'package:bitcoinconverter/controller/conversion_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(ConversionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bitcoin Coverter App"),
        ),
        body: Obx(
          () => controller.isLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                              height: 200,
                              width: 200,
                              child: Image.asset("assets/images/cover.PNG")),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.monetization_on),
                              border: OutlineInputBorder(),
                              labelText: "USD to Bitcoin",
                              hintText: '150'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            print('$value');
                            if (value == "") {
                              controller.usdToBitcoin(0.0);
                            }
                            controller.usdToBitcoin(double.parse(value));
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          controller.usdAmount.toString() + " Bitcoin",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.euro),
                              border: OutlineInputBorder(),
                              labelText: "Euro to Bitcoin",
                              hintText: '150'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            print('$value');
                            if (value == "") {
                              controller.euroToBitcoin(0.0);
                            }
                            controller.euroToBitcoin(double.parse(value));
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          controller.euroAmount.toString() + " bitcoin",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.money),
                              border: OutlineInputBorder(),
                              labelText: "GBP to Bitcoin",
                              hintText: '150'),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            print('$value');
                            if (value == "") {
                              controller.poundToBitcoin(0.0);
                            }
                            controller.poundToBitcoin(double.parse(value));
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          controller.gbpAmount.toString() + " bitcoin",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
