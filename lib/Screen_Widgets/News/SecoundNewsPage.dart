import 'package:flutter/material.dart';
import 'package:full_app/constant/Dimensions.dart';
import 'package:full_app/constant/MyAppBar.dart';

class Secoundnewspage extends StatelessWidget {
  final String title;
  final String image;
  final String content;

  const Secoundnewspage({
    super.key,
    required this.title,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'News'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(
            vertical: DimensionsApp.height*0.01,
                horizontal: DimensionsApp.width*0.03
          ),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔄 Full-width image
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),


              /// 📰 Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),



              /// 📝 Content
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ],
          ),
        ),
      ),
    );
  }
}
