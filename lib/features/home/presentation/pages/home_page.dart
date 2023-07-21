import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/routes/app_route_names.dart';
import 'package:gm_motors/core/services/util_service.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/data/entity/car_class.dart';
import 'package:gm_motors/features/home/presentation/widgets/custom_home_drawer.dart';
import 'package:gm_motors/features/home/presentation/widgets/custom_sliver_app_bar.dart';

import '../../../../core/services/remote_service.dart';
import '../../../../core/style/colors.dart';
import '../../controller/home_controller.dart';
import '../widgets/home_card_car.dart';

class HomePage extends ConsumerStatefulWidget {
  final String userName;
  final String userEmail;
  const HomePage({Key? key, this.userName = "", this.userEmail = ""}) : super(key: key);


  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeController).rate(context);
    ref.read(homeController).remoteConfig();
  }



  @override
  Widget build(BuildContext context) {
    ref.watch(homeController);
    return CustomScaffold(
      child: Scaffold(
        drawer: Drawer(
          child: CustomHomeDrawer(
            name: widget.userName,
            email: widget.userEmail,
            profilePressed: (){},
            logOutPressed: () => ref.read(homeController).logOut(context),
            deleteAccountPressed: () => ref.read(homeController).report(
              // ref.read(homeController).validateInput,
              widget.userName,
              widget.userEmail,
                context,
            ),
          )
        ),
        backgroundColor: RemoteService.availableBackgroundColors[RemoteService.backgroundColor],
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              textEditingController: ref.read(homeController).contentController,
              contentSendTapped: (){
                ref.read(homeController).sendPaper(widget.userEmail, widget.userName).then((value) {
                  FocusScope.of(context).unfocus();
                  Utils.fireSnackBar("Taklif va shikoyatlaringiz ko'rib chiqilmoqda", context);
                });
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: StreamBuilder(
                    stream: ref.read(homeController).product,
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
                              // Stream<QuerySnapshot<Map<String, dynamic>>> a = documentSnapshot.reference.collection('products').orderBy("price").snapshots();
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
                                      currency: documentSnapshot["currency"],
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



