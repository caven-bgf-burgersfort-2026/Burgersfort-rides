import 'package:flutter/material.dart';

void main() {
  runApp(BGFRidesApp());
}

class BGFRidesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BGF - Burgersfort Rides',
      theme: ThemeData(primarySwatch: Colors.green),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BGF - Burgersfort Rides'),
        backgroundColor: Colors.green,
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
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RequestRideScreen()));
              },
              child: Text('Request Ride', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestRideScreen extends StatefulWidget {
  @override
  _RequestRideScreenState createState() => _RequestRideScreenState();
}

class _RequestRideScreenState extends State<RequestRideScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Your Ride'), backgroundColor: Colors.green),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: fromController, decoration: InputDecoration(labelText: 'From where? (e.g. Burgersfort Town)', border: OutlineInputBorder())),
            SizedBox(height: 15),
            TextField(controller: toController, decoration: InputDecoration(labelText: 'To where? (e.g. Steelpoort)', border: OutlineInputBorder())),
            SizedBox(height: 15),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Your phone number', border: OutlineInputBorder()), keyboardType: TextInputType.phone),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: Size(double.infinity, 50)),
              onPressed: () {
                if (fromController.text.isEmpty || toController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill From and To')));
                  return;
                }
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Ride Requested! 🎉'),
                    content: Text('From: ${fromController.text}\nTo: ${toController.text}\nPhone: ${phoneController.text}\n\nDriver will call you soon!'),
                    actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: Text('OK'))],
                  ),
                );
              },
              child: Text('CONFIRM RIDE REQUEST', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
