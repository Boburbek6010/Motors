import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gm_motors/core/widget/custom_scaffold.dart';
import 'package:gm_motors/features/detail/controller/detail_controller.dart';

import '../../../../core/style/colors.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(detailController);
    ref.read(detailController).init(context);
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 70,

          title: Text(ref.read(detailController).customCar!.name, style: const TextStyle(
            color: AppColors.white,
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CachedNetworkImage(
                imageUrl: ref.read(detailController).customCar!.image!,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Text('Qisqacha Ta\'rif:', style: TextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 15),
              Text(ref.read(detailController).customCar!.desc, style: const TextStyle(
                color: AppColors.white,
                  fontWeight: FontWeight.w300
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
