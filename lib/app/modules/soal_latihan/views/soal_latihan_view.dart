import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SoalLatihanView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PythagorasController extends GetxController {
  var selectedAnswer = ''.obs;
  var currentQuestion = 1.obs;
  var totalQuestions = 10.obs;

  void selectAnswer(String answer) {
    selectedAnswer.value = answer;
  }

  void nextQuestion() {
    if (currentQuestion.value < totalQuestions.value) {
      currentQuestion.value++;
      selectedAnswer.value = '';
    }
  }

  void previousQuestion() {
    if (currentQuestion.value > 1) {
      currentQuestion.value--;
      selectedAnswer.value = '';
    }
  }
}

class SoalLatihanView extends StatelessWidget {
  final PythagorasController controller = Get.put(PythagorasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7D7D7),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black87),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Matematika (Pythagoras)',
                      style: TextStyle(
                        fontFamily: 'poppins-SemiBold',
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Card soal
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            children: [
                              // Gambar segitiga
                              Container(
                                height: 150,
                                width: 150,
                                padding: EdgeInsets.all(16),
                                child: Image.asset(
                                  'assets/images/segitiga.png',
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_outlined, size: 50, color: Colors.grey[400]),
                                          SizedBox(height: 8),
                                          Text(
                                            'Masukkan gambar segitiga\ndi assets/images/segitiga.png',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 16),

                              // Badge poin
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Color(0XFFFA8400),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Nilai 10 poin',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),

                              // Teks soal
                              Flexible(
                                child: Text(
                                  'Sebuah segitiga ABC dengan siku-siku di A, memiliki panjang sisi miring (a) sama dengan 5 cm dan sisi mendatar (c) sama dengan 3. Berapakah panjang sisi tegak (b)?',
                                  style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              SizedBox(height: 50),

                              // Pilihan jawaban
                              Container(
                                padding: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Color(0XFFC7D7D7),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: _buildAnswerOption('2 cm')),
                                        SizedBox(width: 20),
                                        Expanded(child: _buildAnswerOption('10 cm')),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(child: _buildAnswerOption('30 cm')),
                                        SizedBox(width: 20),
                                        Expanded(child: _buildAnswerOption('4 cm')),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 50),

                    // Tombol navigasi
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    GestureDetector(
      onTap: controller.previousQuestion,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0XFF143C3C),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
      ),
    ),

    ElevatedButton(
      onPressed: () {
        Get.offNamed(Routes.HASIL_SOALLATIHAN);
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(0),
        backgroundColor: Color(0XFF143C3C),
        minimumSize: Size(50, 50),
      ),
      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20),
    ),
  ],
),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOption(String text) {
    return Obx(() {
      bool isSelected = controller.selectedAnswer.value == text;

      return GestureDetector(
        onTap: () => controller.selectAnswer(text),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Color(0XFFFA8400) : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }
}
