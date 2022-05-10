import 'package:chattr/views/screens/nearby/nearby_bloc.dart';
import 'package:flutter/material.dart';

var _bloc = NearbyBloc();

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Nearby Screen")),
    );
  }
}
