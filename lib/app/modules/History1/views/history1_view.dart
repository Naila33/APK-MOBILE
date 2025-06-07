import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';
import 'package:tenova/app/widgets/navbar.dart';

class History1View extends StatelessWidget {
  final RxString selectedFilter = 'Semua'.obs;

  final List<Map<String, dynamic>> history = [
    {
      "mapel": "IPS",
      "tanggal": "15 Mei 2025",
      "benar": "12/20",
      "skor": 60,
      "tipe": "Latihan soal"
    },
    {
      "mapel": "IPA",
      "tanggal": "16 Mei 2025",
      "benar": "15/20",
      "skor": 75,
      "tipe": "Latihan soal"
    },
    {
      "mapel": "Matematika",
      "tanggal": "17 Mei 2025",
      "benar": "18/20",
      "skor": 90,
      "tipe": "Ujian"
    },
    {
      "mapel": "Bahasa Indonesia",
      "tanggal": "18 Mei 2025",
      "benar": "10/20",
      "skor": 50,
      "tipe": "Latihan soal"
    },
    {
      "mapel": "Bahasa Inggris",
      "tanggal": "19 Mei 2025",
      "benar": "14/20",
      "skor": 70,
      "tipe": "Ujian"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("History", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: CustomNavbar(currentIndex: 3),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ["Semua", "Latihan soal", "Ujian"].map((filter) {
                final bool isSelected = selectedFilter.value == filter;
                return FilterChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (_) => selectedFilter.value = filter,
                  selectedColor: const Color(0xFFF38F1C),
                  backgroundColor: const Color(0xFF365656),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                );
              }).toList(),
            )),
            const SizedBox(height: 30),

            Expanded(
              child: Obx(() {
                final filtered = selectedFilter.value == "Semua"
                    ? history
                    : history.where((e) => e["tipe"] == selectedFilter.value).toList();

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final item = filtered[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.HISTORYFULL, arguments: item);
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
                                              color: Color(0XFF365656), fontSize: 12)),
                                      const SizedBox(width: 8),
                                      Text(
                                        "${item["benar"]} benar",
                                        style: const TextStyle(
                                            color: Color(0XFF365656), fontSize: 12),
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
                                color: Color(0XFF365656),
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
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
