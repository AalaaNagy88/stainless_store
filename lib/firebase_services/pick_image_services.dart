import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class PickImageServices {
  File _image;
  RxString photoUrl = RxString();
  RxBool loading = RxBool();
  PickImageServices() {
    photoUrl.value = "";
    loading.value = false;
  }

  void pickFromCamera() async {
    final pickedPath = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedPath != null) {
      _image = File(pickedPath.path);
    } else
      _image = null;
    photoUrl.value = await uploadImage();
  }

  void pickFromGallery() async {
    final pickedPath =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedPath != null) {
      _image = File(pickedPath.path);
    } else
      _image = null;
    photoUrl.value = await uploadImage();
  }

  Future<String> uploadImage() async {
    try {
      loading.value = true;
      String fileName = p.basename(_image.path);
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child("/$fileName");
      firebase_storage.UploadTask uploadTask = ref.putFile(_image);
      firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => {});
      loading.value = false;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      Get.snackbar(e.message, "");
      return null;
    }
  }
}
