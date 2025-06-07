import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenova/app/routes/app_pages.dart';

void main() {
  runApp(const UjianView());
}

class UjianView extends StatelessWidget {
  const UjianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;

  // Soal, tiap soal ada properti isPG: true untuk pilihan ganda, false untuk uraian
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Kapan berdirinya ASEAN (Association of Southeast Asian Nations)?',
      'isPG': true,
      'options': [
        '8 Agustus 1967',
        '15 Agustus 1967',
        '10 Agustus 1967',
        '29 Agustus 1967',
      ],
    },
    {
      'question':
          'Apa saja faktor yang memengaruhi interaksi sosial antarindividu dalam masyarakat? Berikan contohnya!',
      'isPG': false,
    },
    // Bisa tambah soal lainnya...
  ];

  // Menyimpan jawaban pilihan ganda: key = index soal, value = index pilihan
  Map<int, int> selectedOptions = {};

  // Menyimpan jawaban uraian: key = index soal, value = teks jawaban
  Map<int, String> essayAnswers = {};

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final isPG = currentQuestion['isPG'] as bool;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            const SizedBox(width: 12),
            const Text(
              'IPS',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Colors.black),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Navigasi Soal',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: List.generate(
                              questions.length,
                              (i) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentQuestionIndex = i;
                                  });
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: currentQuestionIndex == i
                                      ? const Color(0xFFF48D17)
                                      : const Color(0xFF143C3C),
                                  child: Text(
                                    '${i + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 13.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF143E3C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Nama: Annisa Salsabila',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '04:13',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFC9D6D5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(minHeight: 180),
                      padding: const EdgeInsets.fromLTRB(16, 40, 16, 48),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xFFC9D6D5),
                              child: Text(
                                '${currentQuestionIndex + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            currentQuestion['question'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Jawaban sesuai tipe soal
                    isPG
                        ? Column(
                            children: List.generate(
                              currentQuestion['options'].length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedOptions[currentQuestionIndex] =
                                          index;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 15),
                                    decoration: BoxDecoration(
                                      color: selectedOptions[
                                                  currentQuestionIndex] ==
                                              index
                                          ? const Color(0xFFF48D17)
                                          : const Color(0xFF335C5C),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.white,
                                          child: Text(
                                            String.fromCharCode(65 + index),
                                            style: const TextStyle(
                                              color: Color(0xFF335C5C),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          currentQuestion['options'][index],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : TextFormField(
    initialValue: essayAnswers[currentQuestionIndex] ?? '',
    maxLines: 6,
    style: const TextStyle(color: Colors.white), // Warna teks jadi putih
    decoration: InputDecoration(
      hintText: 'Ketik jawaban Anda di sini...',
      hintStyle: const TextStyle(color: Colors.white60), // Hint juga putih tapi sedikit transparan
      filled: true,
      fillColor: const Color(0xFF385656),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)),
    ),
    onChanged: (val) {
      essayAnswers[currentQuestionIndex] = val;
    },
  ),

                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: currentQuestionIndex == 0
                                ? null
                                : () {
                                    setState(() {
                                      currentQuestionIndex--;
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: currentQuestionIndex == 0
                                  ? Colors.grey
                                  : const Color(0xFF143C3C),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              'Sebelumnya',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
  child: ElevatedButton(
    onPressed: () {
      if (currentQuestionIndex == questions.length - 1) {
        Get.toNamed(Routes.HASIL_UJIAN);
      } else {
        setState(() {
          currentQuestionIndex++;
        });
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF143C3C),
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Text(
      currentQuestionIndex == questions.length - 1
          ? 'Selesai'
          : 'Selanjutnya',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
      
                      ],
                    )
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
