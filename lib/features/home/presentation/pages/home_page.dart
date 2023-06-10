import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/routes/app_route_names.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/data/entity/car_class.dart';

import '../../../../core/style/colors.dart';
import '../../controller/home_controller.dart';
import '../widgets/home_card_car.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(homeController);
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          title: const Text(
            'GM Motors',
            style: TextStyle(fontSize: 20, color: AppColors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 207,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemCount: 8,
            itemBuilder: (BuildContext ctx, index) {
              return HomeCardCar(
                image: ref.read(homeController).carImage[index],
                text: ref.read(homeController).carName[index],
                onTap: (){
                  Navigator.pushNamed(context, AppRouteNames.DETAIL, arguments: CustomCar(name: ref.read(homeController).carName[index], image: ref.read(homeController).carImage[index],));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
