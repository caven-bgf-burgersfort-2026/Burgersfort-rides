import 'package:flutter/material.dart';

void main() {
  runApp(BGFApp());
}

class BGFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burgersfort Rides - BGF',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BGF - Burgersfort Rides'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_taxi, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text('Welcome to BGF Rides', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Burgersfort Taxi & Rides App'),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: Text('Request Ride'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
