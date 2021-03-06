import 'dart:io';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:stainless_v2/services/user_services.dart';

class PickImageServices {
  File _image;
  RxString photoUrl = "".obs;
  RxBool loading = false.obs;

  void pickFromCamera() async {
    final pickedPath = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedPath != null) {
      _image = File(pickedPath.path);
    } else
      _image = null;
    photoUrl.value = await uploadImage();
    UserServices.to.user.updateProfile(photoURL: photoUrl.value);
  }

  void pickFromGallery() async {
    final pickedPath =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedPath != null) {
      _image = File(pickedPath.path);
    } else
      _image = null;
    photoUrl.value = await uploadImage();
    UserServices.to.user.updateProfile(photoURL: photoUrl.value);
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
