import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';
import 'package:tenova/app/widgets/navbar.dart';

class Ujian1View extends StatelessWidget {
  const Ujian1View({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CustomNavbar(currentIndex: 1),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height + 100,
          child: Stack(children: [
            // HEADER
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF143C3C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Selamat mengerjakan latihan soal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            // Konten di bawah header
            Positioned(
              top: 190,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Profil Card
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/prof.jpg'),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Annisa Salsanila',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'IX A',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Judul Soal Ujian
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Soal ujian',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  // Contoh kartu soal (bisa diganti ListView nanti)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: _ExamCard(
                      title: "IPS",
                      time: "07.00 - 09.00 AM",
                      onPressed: () {
                        Get.offNamed(Routes.UJIAN);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: _ExamCard(
                      title: "IPA",
                      time: "10.00 - 125.00 AM",
                      onPressed: () {
                        Get.offNamed(Routes.LATIHAN_SOAL);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: _ExamCard(
                      title: "Matematika",
                      time: "12.00 - 14.00 AM",
                      onPressed: () {
                        Get.offNamed(Routes.LOGIN);
                      },
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class _ExamCard extends StatelessWidget {
  final String title;
  final String time;
  final VoidCallback onPressed;

  const _ExamCard({
    required this.title,
    required this.time,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F6F6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'poppins-SemiBold',
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.punch_clock_outlined),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'poppins-SemiBold',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF143C3C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Mulai",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
