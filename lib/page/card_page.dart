import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CardPage extends StatefulWidget {
  CardPage({Key? key, required this.image, required this.text})
      : super(key: key);
  XFile? image;
  String? text;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
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
            image: DecorationImage(
                image: AssetImage("assets/images/eidcard.png"),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70),
              CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(File(widget.image!.path)),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text.toString(),
                    style: TextStyle(fontSize: 24),
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
