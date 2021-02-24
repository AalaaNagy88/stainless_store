import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/client_detials_controller.dart';

class ClientDetialsView extends GetView<ClientDetialsController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ClientDetialsView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'ClientDetialsView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
