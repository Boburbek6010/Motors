
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/entity/car_class.dart';

final detailController = ChangeNotifierProvider.autoDispose((ref) => DetailCT());

class DetailCT extends ChangeNotifier {

  CustomCar? customCar;
  String info = "";



  void init(BuildContext context){
    getModel(context);
    getInfoOfCar();
  }



  CustomCar getModel(BuildContext context){
    customCar = ModalRoute.of(context)?.settings.arguments as CustomCar;
    return customCar!;
  }

  Map<String, String> carInfo = {
    "Cobalt":"Chevrolet Cobalt - bu neytral dizaynga ega Yevropa standartlari bo'yicha B-segment ga kiruvchi ergonomik va qulay interyerga va vaqt sinovidan o'tgan texnik tarkibga ega bo'lgan subkompakt FWD sedan hisoblanadi.",
    "Damas":"Damas – 0.8 L hajmidagi, 38 ot kuchi quvvatidagi motori bo'lgan besh eshikli tijorat maqsadidagi avtomobil. Uning zamirida doimo amaliyotga moslik va funksional uyg'unlik bo'lib, konstruksiyasi har qanday yo'l sharoitida uzoq yillar davomida buzilishsiz ishlashini kafolatlaydi. Avtomobil ikkita modifikatsiya shaklida chiqariladi: yo'lovchilar uchun, unda o'rindiqlar uch qator qilib joylashtirilgan (2+3+2), va ikki o'rindiqli yuk tashuvchi, furgon kuzovi bilan, yuk ko'tarish qobiliyati 560 kg gacha. Yuritgichi orqa g'ildiraklarga ulangan. Maksimal tezligi 100 km/soat. Belgilangan yonilg'i sarflanishi 90 km/soat tezlikda 7,8 L / 100km ga teng. Avtomobil tijorat yoki oilaviy ehtiyojlar uchun mo'ljallangan. Shaharning tiqilinch sharoitida va zich transport oqimida, tez-tez to'xtab, yuk tushirish va yuk ortish bilan yurish uchun bundan ham qulayroq bo'lgan yuk tashuvchi avtomobilni topish qiyin.",
    "Equinox":"Chevrolet Equinox – shunchaki harakatlanish emas. Chevrolet Equinox 2022 avtomobilining eng muhim afzalligi uning yangi gibrid tizimidir. Yumshoq gibrid start-stop tizimi bilan ishlaydi. Ushbu avtomobillarda oddiy generator o'rniga kuchli quvvatga ega motor-generator o’rnatilgan. U sekinlashganda elektr energiyasini ishlab chiqarib, yuqori quvvatli akkumulyatorni zaryadlaydi.",
    "Lacetti":"Agar Sizga mashinaning tashqi ko'rinishi muhim bo'lsa, Lacetti Sizga mos. Salobatli tashqi va ichki ko'rinishi bo'lgan ushbu avtomobilda har tomonlama mutanosiblik, silliq go'zal shakli, ifodali chiziqlari uyg'un mujassamlashgan. Lacetti ning ixcham uslubli zamonaviy salonida besh kishi qulay joylashadi. Asboblar paneli o'z mutanosibligi va turli-tuman xillari bilan ajralib turadi. Xrom qoplangan elementlari va asboblarining joylashuvi puxta o'ylab chiqilgan. Uning yurish xususiyatlari esa batafsil sinovdan o'tkazilib, barkamol darajasiga yetkazilgan.",
    "Malibu":"Chevrolet Malibu - oldi g'ildirak boshqaruvli o'rta o'lchamli sedan (garchi uni o'lchamlari bo'yicha shubhasiz biznes-klassga kiritish mumkin bo’lsa-da) yoqimli dizayni, yuqori sifatli interyeri, zamonaviy texnologiyalari va boy jihozlarga egaligi bilan ko’zga tashlanadi. U birinchi navbatda, faol hayot tarziga ega, oqilona narxga yuqori darajadagi avtomobil olishni istaydigan, oilali insonlar uchun mo’ljallangan.",
    "Spark":"Chevrolet Spark avtomobili – turli davlatlardagi yetakchi dizaynerlarning ijodiy ishlari mevasidir. U boshidan oxirigacha – haqiqiy Chevrolet avtomobilidir. Yangi Spark, diqqatni o'ziga tortuvchi radiatorning ikki sathli panjarasi va keskin chiziqli qiyofasi bilan, albatta, qayerda bo'lishidan qat’i nazar butun e’tiborni o'ziga tortadi. Bundan tashqari, o'zining ixcham o'lchami va yuksak boshqariluvchanligi tufayli, Spark har qanday shahar harakatiga «kirib» keta oladi.",
    "Nexia":"Chevrolet Neksiya – kompakt klassdagi o'ziga xos uslubli va eng hammabop avtomobillardan biri bo'lib, sportga mos yoqimli qiyofasini va keng qulay, shinam salonni o'zida mujassamlashtiradi. Uni boshqarish oson bo'lib, yuqori texnologik xavfsizlik tizimiga ega. Ichki bezatishning sifatli materiallari mayda jihatlarigacha puxta o'ylab chiqilgan. Katta hajmli yukxonasi safarga borishda hech narsadan voz kechmay, barcha zarur buyumlarni o'zi bilan olib ketish imkonini beradi.",
    "Nexia3":"Chevrolet Neksiya – kompakt klassdagi o'ziga xos uslubli va eng hammabop avtomobillardan biri bo'lib, sportga mos yoqimli qiyofasini va keng qulay, shinam salonni o'zida mujassamlashtiradi. Uni boshqarish oson bo'lib, yuqori texnologik xavfsizlik tizimiga ega. Ichki bezatishning sifatli materiallari mayda jihatlarigacha puxta o'ylab chiqilgan. Katta hajmli yukxonasi safarga borishda hech narsadan voz kechmay, barcha zarur buyumlarni o'zi bilan olib ketish imkonini beradi.",
    "Tahoe":"Yanada jasur. Yanada mukammal. Yanada funksional. Yangi Chevrolet Tahoe - afsonaviy hamda yirik o'lchamli yo'ltanlamas, faqat sizga tegishli bo'lgan ta'sirchan kuchning timsoli. Uning dizayni ajoyib, yorqin, kuzovning ifodali chiziqlari bilan ajralib turadi. Avtomobil motori V8 hajmdagi 5.3 litr va 343 ot kuchi bilan quvvatlantirilgan, 10 - pog'onali avtomatik uzatma va moslashuvchan suspenziya bilan birgalikda har qanday yo'lda mustaqillik bir tasvirlab bo’lmas tuyg'u taqdim etadi.",
  };

  String getInfoOfCar(){
    carInfo.forEach((key, value) {
      if(key == customCar?.name){
        info = value;
      }
    });
    return info;
  }



}
