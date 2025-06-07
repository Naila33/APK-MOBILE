import 'package:get/get.dart';

import '../modules/History1/bindings/history1_binding.dart';
import '../modules/History1/views/history1_view.dart';
import '../modules/hasil_soallatihan/bindings/hasil_soallatihan_binding.dart';
import '../modules/hasil_soallatihan/views/hasil_soallatihan_view.dart';
import '../modules/hasil_ujian/bindings/hasil_ujian_binding.dart';
import '../modules/hasil_ujian/views/hasil_ujian_view.dart';
import '../modules/historyfull/bindings/historyfull_binding.dart';
import '../modules/historyfull/views/historyfull_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/latihan_soal/bindings/latihan_soal_binding.dart';
import '../modules/latihan_soal/views/latihan_soal_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/soal_latihan/bindings/soal_latihan_binding.dart';
import '../modules/soal_latihan/views/soal_latihan_view.dart';
import '../modules/ujian/bindings/ujian_binding.dart';
import '../modules/ujian/views/ujian_view.dart';
import '../modules/ujian1/bindings/ujian1_binding.dart';
import '../modules/ujian1/views/ujian1_view.dart';
import '../widgets/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.UJIAN,
      page: () => const UjianView(),
      binding: UjianBinding(),
    ),
 
    GetPage(
      name: _Paths.HASIL_UJIAN,
      page: () => ExamCompletePage(),
      binding: HasilUjianBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN_SOAL,
      page: () => LatihanSoalView(),
      binding: LatihanSoalBinding(),
    ),
    GetPage(
      name: _Paths.SOAL_LATIHAN,
      page: () => SoalLatihanView(),
      binding: SoalLatihanBinding(),
    ),
    GetPage(
      name: _Paths.HASIL_SOALLATIHAN,
      page: () => HasilSoallatihanView(),
      binding: HasilSoallatihanBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY1,
      page: () => History1View(),
      binding: History1Binding(),
    ),
    GetPage(
      name: _Paths.HISTORYFULL,
      page: () => HistoryfullView(),
      binding: HistoryfullBinding(),
    ),
    GetPage(
      name: _Paths.UJIAN1,
      page: () => const Ujian1View(),
      binding: Ujian1Binding(),
    ),
  ];
}
