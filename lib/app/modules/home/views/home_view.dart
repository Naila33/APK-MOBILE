import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';
import 'package:tenova/app/widgets/navbar.dart';

class HomeView extends StatelessWidget {
  final List<Map<String, dynamic>> historyData = [
    {
      "mapel": "Matematika",
      "tanggal": "2025-05-20",
      "benar": 8,
      "tipe": "Latihan soal",
      "skor": 80
    },
    {
      "mapel": "IPS",
      "tanggal": "2025-05-22",
      "benar": 7,
      "tipe": "Ujian",
      "skor": 70
    },
  ];

 @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    return Scaffold(
      bottomNavigationBar: CustomNavbar(currentIndex: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height + 600,
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
                      'Selamat mengerjakan ujian',
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
              top: 170,
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
                  const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ujian terbaru',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.UJIAN1);
                        },
                        child: const Text(
                          'Selengkapnya',
                          style: TextStyle(color: Color(0XFF335C5C)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: _ExamCard(
                      title: "IPS",
                      time: "07.00 - 09.00 AM",
                      onPressed: () {
                        Get.offNamed(Routes.UJIAN);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: _ExamCard(
                      title: "Math",
                      time: "10.00 - 12.00 AM",
                      onPressed: () {
                        Get.offNamed(Routes.UJIAN);
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // SoalCard Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kumpulan Soal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LATIHAN_SOAL);
                        },
                        child: const Text(
                          'Selengkapnya',
                          style: TextStyle(
                            color: Color(0XFF335C5C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SoalCard(
                        title: 'Math (Pythagoras)',
                        author: 'Pak Budi',
                        jumlahSoal: 10,
                        imageAsset: 'assets/images/mtk.png',
                            imageTop: -25,
                            imageLeft: 0,
                            imageHeight: 150,
                            imageWidth: 150,
                        onTap: () => Get.toNamed(Routes.SOAL_LATIHAN),
                      ),
                      SoalCard(
                        title: 'Seni (Seni Rupa)',
                        author: 'Bu Sari',
                        jumlahSoal: 15,
                        imageAsset: 'assets/images/b.indo.png',
                            imageTop: -40,
                            imageLeft: -8,
                            imageHeight: 170,
                            imageWidth: 170,
                        onTap: ()  => Get.toNamed(Routes.SOAL_LATIHAN),
                      ),
                    ].map((card) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 76) / 2,
                        child: card,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // History 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'History Soal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.HISTORY1);
                        },
                        child: const Text(
                          'Selengkapnya',
                          style: TextStyle(
                            color: Color(0XFF335C5C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...historyData.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HISTORYFULL);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF1F1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: item["tipe"] == "Latihan soal"
                                  ? const Color(0xFF143C3C)
                                  : const Color(0xFFF38F1C),
                              child: Text(
                                item["mapel"][0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["mapel"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today,
                                          size: 14, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(item["tanggal"],
                                          style: const TextStyle(
                                              color: Color(0XFF365656),
                                              fontSize: 12)),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${item["benar"]} benar",
                                        style: const TextStyle(
                                            color: Color(0XFF365656),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: item["tipe"] == "Latihan soal"
                                          ? const Color(0xFF365656)
                                          : const Color(0xFFFA8400),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      item["tipe"],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF9F3F),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                item["skor"].toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
          ]
          ),
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
    Key? key,
  }) : super(key: key);

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

class SoalCard extends StatelessWidget {
  final String title;
  final String author;
  final int jumlahSoal;
  final String imageAsset;
  final VoidCallback onTap;
  final double imageTop;
  final double imageLeft;
  final double imageHeight;
  final double imageWidth;

  const SoalCard({
    required this.title,
    required this.author,
    required this.jumlahSoal,
    required this.imageAsset,
    required this.onTap,
    this.imageTop = -15,
    this.imageLeft = 0,
    this.imageHeight = 60,
    this.imageWidth = 60,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 76) / 2,
        height: 180,
        decoration: BoxDecoration(
          color: const Color(0XFF728C8A),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background bagian atas
            Container(
              height: 90,
              decoration: const BoxDecoration(
                color: Color(0xFFC8D7D7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),

            // Gambar
            Positioned(
              top: imageTop,
              left: imageLeft,
              child: Image.asset(
                imageAsset,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.contain,
              ),
            ),

            // Jumlah soal
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$jumlahSoal soal',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Judul dan author
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'by $author',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}