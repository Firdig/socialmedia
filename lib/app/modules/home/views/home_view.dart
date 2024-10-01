import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16) ,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=>controller.selectedImagePath.value==''?
              Text('Select image form camera/gallery',style: TextStyle(fontSize: 20),)
               : Image.file(File(controller.selectedImagePath.value))),

              SizedBox(
                height: 10,
              ),

              Obx(()=>Text(controller.selectedImageSize.value==''?'':
              controller.selectedImageSize.value,style: TextStyle(fontSize: 20),)),

              ElevatedButton(
                onPressed: () {
                  controller.pickImage(ImageSource.camera);
                  // Handle camera action
                },
                child: Text("Camera"),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.pickImage(ImageSource.gallery);

                },
                child: Text("Gallery")
              ) // RaisedButton
            ],
          ),
        )
        )
      );
  }
}
