import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/routes/app_route_names.dart';
import 'package:gm_motors/core/services/util_service.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/data/entity/car_class.dart';
import 'package:gm_motors/features/home/presentation/widgets/custom_home_drawer.dart';
import 'package:gm_motors/features/home/presentation/widgets/custom_sliver_app_bar.dart';

import '../../../../core/style/colors.dart';
import '../../controller/home_controller.dart';
import '../widgets/home_card_car.dart';

class HomePage extends ConsumerWidget {
  final String userName;
  final String userEmail;
  const HomePage({Key? key, this.userName = "", this.userEmail = ""}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    return CustomScaffold(
      child: Scaffold(
        drawer: Drawer(
          child: CustomHomeDrawer(
            name: userName,
            email: userEmail,
            deleteAccountPressed: () {
              log("message1");
              ref.read(homeController).report(context);
            },
            logOutPressed: () {
              log("3");
            },
          )
        ),
        backgroundColor: AppColors.transparent,
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              textEditingController: ref.read(homeController).contentController,
              contentSendTapped: (){
                ref.read(homeController).sendPaper(userEmail, userName).then((value) {
                  FocusScope.of(context).unfocus();
                  Utils.fireSnackBar("Taklif va shikoyatlaringiz ko'rib chiqilmoqda", context);
                });
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: StreamBuilder(
                    stream: ref.read(homeController).products.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if(streamSnapshot.hasData){
                        if(ref.read(homeController).isLoading){
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 207,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                            ),
                            itemCount:  streamSnapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                              return HomeCardCar(
                                image: ref.read(homeController).carImage[index],
                                text: documentSnapshot["name"],
                                onTap: () {
                                  Navigator.pushNamed(context, AppRouteNames.DETAIL,
                                    arguments: CustomCar(
                                      desc: documentSnapshot["description"],
                                      name: documentSnapshot["name"],
                                      image: ref.read(homeController).carImage[index],
                                      price: documentSnapshot["price"].toString(),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else{
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



