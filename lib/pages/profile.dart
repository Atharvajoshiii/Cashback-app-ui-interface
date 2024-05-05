import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatelessWidget {
  final GoogleSignInAccount user;

  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display user's profile picture
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl ?? ""),
                radius: 50,
              ),
              SizedBox(height: 20),
              // Display user's display name
              Text(
                user.displayName ?? "No Display Name",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              // Display user's email
              Text(
                user.email ?? "No Email",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              // Options with logos
              _buildOption("Account Settings", Icons.settings),
              _buildOption("My Earnings", Icons.attach_money),
              _buildOption("Payments", Icons.payment),
              _buildOption("Payment History", Icons.history),
              _buildOption("Missing Cashback", Icons.error_outline),
              _buildOption("Referral Network", Icons.group),
              _buildOption("Call Us", Icons.phone),
              _buildOption("Get Help", Icons.help),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 36,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          // Handle option tap
          // You can navigate to respective pages or perform actions here
        },
      ),
    );
  }
}
