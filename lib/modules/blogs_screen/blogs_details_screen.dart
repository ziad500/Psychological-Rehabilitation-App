import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BlogsDetailsScreen extends StatelessWidget {
  final String title;
  final String cover;
  final String content;

  const BlogsDetailsScreen(
      {Key? key,
      required this.title,
      required this.cover,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6.0,
        centerTitle: true,
        title: const Text('Blogs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 3.5.h,
                    color: const Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Image.network(
              cover,
              height: 218,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 2.3.h,
                  color: const Color(0xff333333),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
