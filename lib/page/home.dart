import 'dart:io';

import 'package:eid_app/page/card_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'card2_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? image;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
              image: const DecorationImage(
                  image: AssetImage("assets/images/eidf.png"),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              SizedBox(height: 170),
              CircleAvatar(
                radius: 58,
                backgroundImage: image == null
                    ? AssetImage("assets/images/camera.png") as ImageProvider
                    : FileImage(
                        File(image!.path),
                      ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (builder) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      height: 120.0,
                                      width: 100.0,
                                      child: Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              ImagePicker p = ImagePicker();
                                              image = await p.pickImage(
                                                  source: ImageSource.camera);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: ListTile(
                                              leading: Icon(Icons.camera_alt),
                                              title: Text("Camera"),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              ImagePicker p = ImagePicker();
                                              image = await p.pickImage(
                                                  source: ImageSource.gallery);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: ListTile(
                                              leading: Icon(Icons.photo),
                                              title: Text("Gallery"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(Icons.camera_alt),
                          ) // change this children
                          ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 50.0, bottom: 8.0),
                child: Row(
                  children: [Text("Name")],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Md. Abdullah Al Siddik",
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (controller.text.length >= 10) {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => Card2Page(image: image,text: controller.text,)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => CardPage(image: image,text: controller.text,)));
                  }
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
