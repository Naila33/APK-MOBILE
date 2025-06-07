import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';

void main() {
  runApp(HasilUjianView());
}

class HasilUjianView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/exam-complete',
      getPages: [
        GetPage(name: '/exam-complete', page: () => ExamCompletePage()),
        GetPage(name: Routes.HOME, page: () => DummyHomePage()),
      ],
    );
  }
}

class ExamCompletePage extends StatelessWidget {
  final String status = "Selesai";
  final String duration = "90 menit";
  final String date = "2/3/2023";
  final String pelajaran = "IPS";

  void goBack() {
    Get.offNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Main Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0x90C8D7D7),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Ujian telah selesai',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '"Terima kasih telah menyelesaikan ujian ini. Semoga hasilnya sesuai dengan usaha terbaikmu!"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF143E3C),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Divider(thickness: 1, color: Colors.grey.shade300),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 16),
                            child: Column(
                              children: [
                                _buildInfoRow("Status ujian :", status),
                                const SizedBox(height: 8),
                                _buildInfoRow("Mata pelajaran :", pelajaran),
                                const SizedBox(height: 8),
                                _buildInfoRow("Waktu pengerjaan :", duration),
                                const SizedBox(height: 8),
                                _buildInfoRow("Tanggal ujian :", date),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: goBack,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0D6B5E),
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: const Text(
                                'Kembali',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: value == "Selesai" ? Colors.orange : Colors.black87,
          ),
        ),
      ],
    );
  }
}

// Dummy halaman beranda
class DummyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Beranda")),
      body: const Center(
        child: Text("Ini halaman beranda"),
      ),
    );
  }
}
