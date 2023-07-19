import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeCT());

class HomeCT extends ChangeNotifier {
  final CollectionReference _user = FirebaseFirestore.instance.collection("user");
  final CollectionReference products = FirebaseFirestore.instance.collection("products");
  final CollectionReference deleteAccount = FirebaseFirestore.instance.collection("products");
  final TextEditingController contentController = TextEditingController();
  final TextEditingController deleteAccountController = TextEditingController();
  final _storage = FirebaseStorage.instance.ref();
  final folder = "product_images";
  bool isLoading = false;

  List<String> carImage = [];

  Future<void> sendPaper(String email, String name,
      [DocumentSnapshot? documentSnapshot]) async {
    final String content = contentController.text;
    await _user.add({"content": content, "email": email, "name": name});
    contentController.text = '';
  }

  Future<String?> getImageUrl(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      Reference reference =
          _storage.child(folder).child("${imgName.toLowerCase()}.jpg");

      String downloadUrl = await reference.getDownloadURL();
      log(downloadUrl);
      return downloadUrl;
    } catch (e) {
      log("Smg Error on $e");
      return e.toString();
    }
  }

  Future<void> getAllImages() async {
    List<String> imgNames = ["bb", "cc"];
    try {
      for (var img in imgNames) {
        final imgUrl = await getImageUrl(img);
        carImage.add(imgUrl!);
      }
      isLoading = true;
    } catch (e) {
      log("Error occured at $e");
    }
    notifyListeners();
  }

  HomeCT() {
    getAllImages();
  }

  Future<void> report(BuildContext context, [DocumentSnapshot? documentSnapshot]) async {

    log("message");

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          notifyListeners();
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tell the reason why you are deleting your account?"),
                TextField(
                  controller: deleteAccountController,
                  decoration: const InputDecoration(labelText: 'Reason'),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  child: const Text('Report'),
                  onPressed: () async {
                    final String reason = deleteAccountController.text;
                    final String date = "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} \nsoat:${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
                    await deleteAccount.add({"reason": reason, "date": date});
                    deleteAccountController.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        },
    );
  }
}
