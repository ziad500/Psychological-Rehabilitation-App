import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Dio dio = Dio();

  void _upload(File file) async {
    String fileName = file.path.split('/').last;
    print(file.path);
    var data = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(
        file.path,
        contentType: MediaType('image', 'jpg'),
      ),
      'firstName': 'firstName',
      'lastName': 'lastName',
      'email': 'emailss0@jkbk.com',
      'password': '123456',
      'mobilePhone': '01224122391',
      'gender': 'male',
      'birthDate': '7/5/2000',
      'trustContact': '01224122391',
      'contactRelation': 'uncle',
      'medicalHistory': 'medicalHistory',
      'sessions': ['sessions']
    });

    Dio dio = Dio();

    dio
        .post("https://healthmental-you.herokuapp.com/auth/signup/User",
            data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }

  Future getImage() async {
    File _image;
    final picker = ImagePicker();

    var _pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    setState(() {
      _image = File(_pickedFile!.path);
      _upload(_image);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            getImage();
          },
          label: Text('add')),
    );
  }
}
