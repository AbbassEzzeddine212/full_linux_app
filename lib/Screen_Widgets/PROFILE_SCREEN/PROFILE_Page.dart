import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Profile'),
      body: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            // Profile Picture + Name + Number
            Row(
              spacing: 15,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/profilr.avif'),
                ),

                Expanded(
                  child:  Text(
                    "Hadi Ezzeddine\n70610395",
                    style: Theme.of(context).textTheme.headlineLarge
                  ),
                ),
                // const Text("70610395", style: TextStyle(fontSize: 16)),
              ],
            ),

            const Divider(
              thickness: 2,
              color: Colors.black,
              indent: 16,
              endIndent: 16,
            ),

            // Menu items
            _buildOption("Language"),
            _buildOption("Settings"),
            _buildOption("Privacy"),
            _buildOption("support"),
            _buildOption("logout", isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String title, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DimensionsApp.width * 0.03,
            vertical: DimensionsApp.height * 0.01,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title, style: TextStyle(fontSize: 13)),
          ),
        ),
        if (!isLast)
          Divider(
            thickness: 1,
            color: Colors.black26,
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}
