import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';

void main() => runApp(HasilSoallatihanView());

class HasilSoallatihanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LatihanSelesaiPage(),
    );
  }
}

class LatihanSelesaiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF2F4F4F);
    final Color accentColor = Color(0xFFFF8C00);

     return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Main card container
              Container(
                width: double.infinity,
                height: 400,
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Color(0XFF365656),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Tambahkan ini
                  children: [
                    // Title badge
                    Container(

                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Latihan selesai",
                        style: TextStyle(
                          fontFamily: 'poppins-Bold',
                          color: Color(0XFF143C3C),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Hasil latihan soal anda",
                      style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 32),
                    // Circular progress with score
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 170,
                          width: 170,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 3,
                            valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "70",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                "Points",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildInfo("Jawaban benar", "9 soal"),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: buildInfo("Jawaban salah", "6 soal"),
                        ),
                      ],
                    ),
                    SizedBox(height: 34),
                    Row(
                      children: [
                        Expanded(
                          child: buildInfo("Soal belum selesai", "5 soal"),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: buildInfo("Waktu", "30 menit"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(Routes.HOME); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    elevation: 2,
                    
                  ),
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      );
  }

  Widget buildInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0XFF355256),
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}