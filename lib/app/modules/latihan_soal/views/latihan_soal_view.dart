import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';
import 'package:tenova/app/widgets/navbar.dart';

class LatihanSoalView extends StatelessWidget {
  const LatihanSoalView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const CustomNavbar(currentIndex: 2),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height + 100,
          child: Stack(
            children: [
              // HEADER
              Container(
                height: 350,
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

              // SEARCH
              Positioned(
                top: 180,
                left: 55,
                right: 55,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Cari di sini',
                    hintStyle: const TextStyle(color: Color(0X90FFFFFF)),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: const Color(0XFF2A5151),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Konten di bawah header
            Positioned(
              top: 240,
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
                    const SizedBox(height: 30),

                    // SOAL CARDS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          SoalCard(
                            title: 'Math (Pythagoras)',
                            author: 'Pak Budi',
                            jumlahSoal: 10,
                            imageAsset: 'assets/images/mtk.png',
                            imageTop: -25,
                            imageLeft: -3,
                            imageHeight: 150,
                            imageWidth: 150,
                            onTap: () => Get.toNamed(Routes.SOAL_LATIHAN),
                          ),
                          SoalCard(
                            title: 'B.Indonesia\n(Kata Tanya)',
                            author: 'Bu Sari',
                            jumlahSoal: 15,
                            imageAsset: 'assets/images/b.indo.png',
                            imageTop: -45,
                            imageLeft: -5,
                            imageHeight: 170,
                            imageWidth: 170,
                            onTap: () {},
                          ),
                          SoalCard(
                            title: 'English (Tenses)',
                            author: 'Bu Vira',
                            jumlahSoal: 20,
                            imageAsset: 'assets/images/b.inggros.png',
                            imageTop: -65,
                            imageLeft: -20,
                            imageHeight: 200,
                            imageWidth: 200,
                            onTap: () {},
                          ),
                          SoalCard(
                            title: 'IPA (Sistem Pencernaan)',
                            author: 'Bu Alfi',
                            jumlahSoal: 20,
                            imageAsset: 'assets/images/IPA.png',
                            imageTop: -5,
                            imageLeft: 38,
                            imageHeight: 100,
                            imageWidth: 100,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
              left: 70,
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
