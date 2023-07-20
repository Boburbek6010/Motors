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
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController currencyController = TextEditingController();

    final CollectionReference products = FirebaseFirestore.instance.collection("products");



    Future<void> productCreate([DocumentSnapshot? documentSnapshot]) async {

      await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext ctx) {
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
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(labelText: 'Desc'),
                  ),
                  TextField(
                    controller: currencyController,
                    decoration: const InputDecoration(labelText: 'Currency'),
                  ),
                  TextField(
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                    controller: priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Create'),
                    onPressed: () async {
                      final String name = nameController.text;
                      final String currency = currencyController.text;
                      final String desc = descController.text;
                      final double? price = double.tryParse(priceController.text);
                      if (price != null) {
                        await products.add({"name": name, "price": price, "description": desc, "currency": currency});

                        nameController.text = '';
                        priceController.text = '';
                        descController.text = '';
                        currencyController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            );

          });
    }



    log(userName.toString());
    ref.watch(homeController);
    return CustomScaffold(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            productCreate();
          },
        ),
        drawer: Drawer(
          child: CustomHomeDrawer(
            name: userName,
            email: userEmail,
            profilePressed: (){},
            logOutPressed: () {},
            deleteAccountPressed: () {
              ref.read(homeController).report(
                userName,
                userEmail,
                context,
              );
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
                              Object? customCar = streamSnapshot.data!.docChanges[index].doc.data();
                              Map<String, dynamic> car = customCar as Map<String, dynamic>;
                              CustomCar data = CustomCar.fromJson(car);
                              log("name: ${data.name}");
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
                                      price: documentSnapshot["price"],
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



