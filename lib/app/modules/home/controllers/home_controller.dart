import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var selectedImagePath=''.obs;
  var selectedImageSize=''.obs;

  void pickImage(ImageSource imageSource) async
  {

    final pickedFile= await ImagePicker().pickImage(source: imageSource);
    if(pickedFile!=null){
      selectedImagePath.value= pickedFile.path;
      selectedImageSize.value=((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" Mb";


    }
    else
      {
        Get.snackbar('Error', 'No image selected',snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,colorText: Colors.white);
      }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}


