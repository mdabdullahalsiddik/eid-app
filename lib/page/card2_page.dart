// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Card2Page extends StatefulWidget {
  Card2Page({ Key? key, required this.image, required this.text}):super(key: key);
  XFile? image;
  String? text;

  @override
  State<Card2Page> createState() => _Card2PageState();
}

class _Card2PageState extends State<Card2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade300,
        iconTheme: IconThemeData(color: Colors.black),
        
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
            image:  DecorationImage(
                image: AssetImage("assets/images/eidd.jpg"), fit: BoxFit.fill)),
        child:  Center(
          child: Column(
            children: [
              SizedBox(height: 70),
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(widget.image!.path)),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   widget.text.toString(),
                    style: TextStyle(fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
