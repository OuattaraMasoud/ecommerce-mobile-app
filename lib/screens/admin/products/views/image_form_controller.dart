import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';

class CompleteProfileController with ChangeNotifier {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();
  XFile? _image;
  String? _downloadUrl;
  XFile? get image => _image;
  String? get downloadUrl => _downloadUrl;

  Future<XFile?> pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 10);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
    }
    return pickedFile;
  }

  Future<XFile?> pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 10);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
    }
    return pickedFile;
  }

  void pickImage(context, FormFieldSetter<XFile>? onChanged,
      FormFieldState<XFile> state) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              textAlign: TextAlign.center,
              'Choisir la source de l\'image',
              style: TextStyle(fontSize: 12.sp),
            ),
            content: SizedBox(
              height: 140.h,
              child: Column(
                children: [
                  ListTile(
                    onTap: () async {
                      var pickedImage = await pickCameraImage(context);
                      if (onChanged != null) {
                        onChanged(pickedImage);
                      }
                      state.didChange(pickedImage);
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.camera),
                    title: const Text('Caméra'),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      var pickedImage = await pickGalleryImage(context);
                      if (onChanged != null) {
                        onChanged(pickedImage);
                      }
                      state.didChange(pickedImage);
                    },
                    leading: const Icon(Icons.image),
                    title: const Text('Galérie'),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<String?> uploadImage(XFile? pickedImage) async {
    if (pickedImage == null) return null; // Vérifie si une image a été choisie

    try {
      FirebaseStorage storage = FirebaseStorage.instance;

      // Génère un nom de fichier unique basé sur un timestamp
      String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

      // Référence dans Firebase Storage avec un chemin unique pour chaque image
      Reference storageReference =
          storage.ref().child("products/images/$fileName");

      // Téléchargement de l'image sélectionnée
      UploadTask uploadTask =
          storageReference.putFile(File(pickedImage.path).absolute);

      // Attente de la fin du téléchargement
      TaskSnapshot taskSnapshot = await uploadTask;

      // Récupération de l'URL de téléchargement de l'image
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Retourne l'URL de téléchargement de l'image
      return downloadUrl;
    } catch (e) {
      print('Erreur lors du téléchargement de l\'image: $e');
      return null;
    }
  }
}
