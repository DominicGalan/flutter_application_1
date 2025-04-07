import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(
              "Animania App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           SizedBox(height: 10),
           Text(
              "Neil Dominic P. Galan, I created this App.",
              style: TextStyle(fontSize: 16),
            ),
           SizedBox(height: 10),
           Divider(),
           SizedBox(height: 10),
           Text(
              "Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
           ListTile(
              leading: Icon(Icons.movie),
              title: Text("Anime List"),
              subtitle: Text("View and manage your favorite anime."),
            ),
           ListTile(
              leading: Icon(Icons.book),
              title: Text("Manga List"),
              subtitle: Text("View and manage your favorite manga."),
            ),
           SizedBox(height: 20),
           Text(
              "Contact Information:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
           ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("[ndpgalan.student@ua.edu.ph]"),
            ),
           ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone"),
              subtitle: Text("[+639762905176]"),
            ),
          ],
        ),
      ),
    );
  }
}