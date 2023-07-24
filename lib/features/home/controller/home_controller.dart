import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/routes/app_route_names.dart';
import 'package:gm_motors/core/services/auth_service.dart';
import 'package:gm_motors/core/services/util_service.dart';
import 'package:gm_motors/core/style/colors.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../../core/services/remote_service.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeCT());

class HomeCT extends ChangeNotifier {
  final CollectionReference _user = FirebaseFirestore.instance.collection("user");
  final Stream<QuerySnapshot<Map<String, dynamic>>> product = FirebaseFirestore.instance.collection("products").orderBy("price").snapshots();
  final CollectionReference deleteAccount = FirebaseFirestore.instance.collection("deleteAccount");
  final TextEditingController contentController = TextEditingController();
  final TextEditingController deleteAccountController = TextEditingController();
  final _storage = FirebaseStorage.instance.ref();
  final folder = "product_images";
  bool isLoading = false;
  List<String> carImage = [];
  bool hasError = false;
  String errorText = '';

  Future<void> sendPaper(String email, String name, [DocumentSnapshot? documentSnapshot]) async {
    final String content = contentController.text;
    await _user.add({"content": content, "email": email, "name": name});
    contentController.text = '';
  }

  Future<String?> getImageUrl(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      Reference reference = _storage.child(folder).child("$imgName.png");

      String downloadUrl = await reference.getDownloadURL();
      log(downloadUrl);
      return downloadUrl;
    } catch (e) {
      log("Smg Error on $e");
      return e.toString();
    }
  }

  Future<void> getAllImages() async {
    List<String> imgNames = [
      "damas",
      "Labo",
      "spark",
      "nexia",
      "cobalt",
      "lacetti",
      "onix",
      "tracker",
      "malibu",
      "equinox",
      "traverse",
      "Tahoe"
    ];
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

  Future<void> remoteConfig() async {
    await RemoteService.initConfig();
    notifyListeners();
  }

  void validateInput(String input) {
    if (input.length >= 5) {
      log("true");
      hasError = false;
      errorText = "";
    } else {
      log("false");
      hasError = true;
      errorText = 'Input must be at least 5 characters';
    }
    notifyListeners();
  }

  Future<void> report(String name, String contact, BuildContext context,
      [DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Tell the reason why you are deleting your account?"),
              Consumer(
                builder: (context, ref, child) {
                  final homeCT = ref.watch(homeController);
                  return TextField(
                    onChanged: validateInput,
                    decoration: InputDecoration(
                      errorText: homeCT.hasError ? errorText : null,
                    ),
                    controller: deleteAccountController,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                  shape: const StadiumBorder(),
                  color: AppColors.white,
                  onPressed: () async {
                    if (!hasError) {
                      final String reason = deleteAccountController.text;
                      final String date = "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}  \nsoat:${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
                      await deleteAccount.add({
                        "reason": reason,
                        "date": date,
                        "name": name,
                        "contact": contact
                      });
                      deleteAccountController.text = '';
                      await Future.delayed(Duration.zero);
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Utils.fireSnackBar("Sizni so'rovingizni tez orada ko'rib chiqamiz", context);
                    }
                  },
                  child: const Text('Report'))
            ],
          ),
        );
      },
    );
    notifyListeners();
  }

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rate_motors_',
    minDays: 2,
    minLaunches: 3,
    remindDays: 2,
    remindLaunches: 3,
    googlePlayIdentifier: 'com.gm_motors',
  );


  Future<void> rate(BuildContext context) async {
    rateMyApp.init().then((_) {
      if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showRateDialog(
          context,
          title: 'Rate this app',
          message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.',
          rateButton: 'RATE',
          noButton: 'NO THANKS',
          laterButton: 'MAYBE LATER',
          listener: (button) {
            switch(button) {
              case RateMyAppDialogButton.rate:
                print('Clicked on "Rate".');
                break;
              case RateMyAppDialogButton.later:
                print('Clicked on "Later".');
                break;
              case RateMyAppDialogButton.no:
                print('Clicked on "No".');
                break;
            }

            return true;
          },
          ignoreNativeDialog: Platform.isAndroid,
        );
      }
    });
  }

  Future<void> logOut(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Would you like to approve of this message?\nAre you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                AuthService.signOutUser(context);
                Navigator.pushNamedAndRemoveUntil(context, AppRouteNames.AUTHGATE, (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
