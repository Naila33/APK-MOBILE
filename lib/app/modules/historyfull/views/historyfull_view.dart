import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryfullView extends StatelessWidget {
  // data bisa nullable, supaya aman
  final Map<String, dynamic>? data = Get.arguments;

  final List<Map<String, dynamic>> sampleSoal = [
    {
      "nomor": 1,
      "soal":
          "Sebuah segitiga ABC dengan siku-siku di A, memiliki panjang sisi miring (a) sama dengan 5 cm dan sisi mendatar (c) sama dengan 3. Berapakah panjang sisi tegak (b)?",
      "jawabanBenar": "2 cm",
      "jawabanUser": "30 cm",
    },
    {
      "nomor": 2,
      "soal":
          "Sebuah segitiga ABC dengan siku-siku di A, memiliki panjang sisi miring (a) sama dengan 5 cm dan sisi mendatar (c) sama dengan 3. Berapakah panjang sisi tegak (b)?",
      "jawabanBenar": "2 cm",
      "jawabanUser": "2 cm",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2E0E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD2E0E0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "History",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    data?["mapel"] ?? "IPS",  // Aman jika data null
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF365656),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                "Total benar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "30",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFA8400),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: const [
                              Text(
                                "Total salah",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "5",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // List soal
            Expanded(
              child: ListView.builder(
                itemCount: sampleSoal.length,
                itemBuilder: (context, index) {
                  final soal = sampleSoal[index];
                  final bool isCorrect =
                      soal["jawabanUser"] == soal["jawabanBenar"];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border(
                        top: BorderSide(
                          color: isCorrect ? Colors.green : Colors.red,
                          width: 6,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nomor soal
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Color(0XFFC8D7D7),
                          child: Text(
                            soal["nomor"].toString(),
                            style: const TextStyle(
                                fontSize: 12, 
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Pertanyaan
                        Text(
                          soal["soal"],
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 12),
                        // Pilihan jawaban
                        Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    if (!isCorrect)
      _JawabanCard(
        label: "Salah",
        jawaban: soal["jawabanUser"],
        isSelected: true,
        warna: Colors.orange,
      ),
    _JawabanCard(
      label: "Benar",
      jawaban: soal["jawabanBenar"],
      isSelected: isCorrect,
      warna: const Color(0XFFC8D7D7),
    ),
  ],
)

                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JawabanCard extends StatelessWidget {
  final String label;
  final String jawaban;
  final bool isSelected;
  final Color warna;

  const _JawabanCard({
    required this.label,
    required this.jawaban,
    required this.isSelected,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: warna,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            jawaban,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
