import 'package:justverify/QRscanner.dart';
import 'package:justverify/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:justverify/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Color(0xFFA168FF),
        actions: [
          /*IconButton(
            icon: Icon(Icons.menu), // Hamburger menu icon
            onPressed: () {
              // Open the Drawer when the hamburger menu icon is tapped
              Scaffold.of(context).openDrawer();
            },
          ),*/
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFA168FF),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Verify'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UI()),
                ); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Barcode'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BarcodeScannerPage()),
                ); // Close the drawer
              },
            ),
            Divider(), // Add dividers as needed
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                _signOut();
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          ArticleWidget(
            title:
                " Combating Counterfeiting with Cutting-Edge Technology: The Rise of Mobile Camera-Based AI Verification Apps",
            content: "",
          ),
          ArticleWidget(
            title: "Article 2",
            content: "This is the content of article 2.",
          ),
          // Add more articles as needed
        ],
      ),
    );
  }

  Widget _buildRoundButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(text),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFA168FF), // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Make it round
          ),
        ),
      ),
    );
  }
}

class ArticleWidget extends StatelessWidget {
  final String title;
  final String content;

  ArticleWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(content),
        ],
      ),
    );
  }
}
