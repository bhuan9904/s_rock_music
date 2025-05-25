import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String serviceName;

  const DetailsScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        title: const Text("Service Detail",style: TextStyle(color: Colors.white,),),
        backgroundColor: const Color(0xFF0F0F0F),
      ),
      body: Center(
        child: Text(
          "You tapped on: $serviceName",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
