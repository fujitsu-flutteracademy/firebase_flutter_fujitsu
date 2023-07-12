import 'package:firebase_flutter_fujitsu/modules/ecomerce/data/models/bike_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BikeDescriptionWidgetObject {
  final BikeModel? bikeModel;

  BikeDescriptionWidgetObject({this.bikeModel});
}

class BikeDescriptionWidget extends StatelessWidget {
  final BikeDescriptionWidgetObject bikeModelObject;
  const BikeDescriptionWidget({
    Key? key,
    required this.bikeModelObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Text(bikeModelObject.bikeModel?.title ?? ''),
          Text(bikeModelObject.bikeModel?.desc ?? ''),
        ],
      ),
    );
  }
}
