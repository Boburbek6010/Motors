import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/features/detail/controller/detail_controller.dart';

import '../../../../core/style/colors.dart';
import '../../../../data/entity/car_class.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final CollectionReference car = FirebaseFirestore.instance.collection("products");


    TextEditingController istemolC = TextEditingController();
    TextEditingController sigimiC = TextEditingController();
    TextEditingController yostiqchaC = TextEditingController();


    // ref.watch(detailController);
    CustomCar? customCar = ModalRoute.of(context)?.settings.arguments as CustomCar;
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 70,

          title: Text(customCar.name, style: const TextStyle(
            color: AppColors.white,
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CachedNetworkImage(
                imageUrl: customCar.image!,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Text('Qisqacha Ta\'rif:', style: TextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 15),
              Text(customCar.desc, style: const TextStyle(
                color: AppColors.white,
                  fontWeight: FontWeight.w300
              ),),
              const SizedBox(height: 20),
              const Text('Narxi:', style: TextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(customCar.price.toString(), style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),),
                  const SizedBox(width: 7),
                  Text(customCar.currency ?? "", style: TextStyle(
                      color: AppColors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w300
                  ),),
                ],
              )
              // Text(data)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
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
                      TextField(
                        controller: istemolC,
                        decoration: InputDecoration(
                          hintText: "Istemol"
                        ),
                      ),
                      TextField(
                        controller: sigimiC,
                        decoration: InputDecoration(
                            hintText: "Sigimi"
                        ),
                      ),
                      TextField(
                        controller: yostiqchaC,
                        decoration: InputDecoration(
                            hintText: "Yostiqcha"
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          shape: const StadiumBorder(),
                          color: AppColors.white,
                          onPressed: () async {
                            final String istemol = istemolC.text;
                            final String sigimi = sigimiC.text;
                            final String yostiqcha = yostiqchaC.text;
                            await car.add({
                              "istemol": istemol,
                              "sigimi": sigimi,
                              "yostiqcha": yostiqcha,
                            });
                          },
                          child: const Text('Report'))

                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
