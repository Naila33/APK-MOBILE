import 'package:flutter/material.dart';
import 'package:tenova/app/modules/home/views/home_view.dart';
import 'package:tenova/app/modules/ujian1/views/ujian1_view.dart';
import 'package:tenova/app/modules/latihan_soal/views/latihan_soal_view.dart';
import 'package:tenova/app/modules/History1/views/history1_view.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomNavbar({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    late final Widget destination;
    switch (index) {
      case 0:
        destination = HomeView();
        break;
      case 1:
        destination = Ujian1View();
        break;
      case 2:
        destination = LatihanSoalView();
        break;
      case 3:
        destination = History1View();
        break;
      default:
        destination = HomeView();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required BuildContext context,
  }) {
    const activeColor = Colors.white;
    const inactiveColor = Color(0xFF2E4949);
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => _onTap(context, index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Garis indikator di atas ikon
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          Icon(
            icon,
            color: isActive ? activeColor : inactiveColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF355A5A),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(icon: Icons.home, index: 0, context: context),
          _buildNavItem(icon: Icons.edit_document, index: 1, context: context),
          _buildNavItem(icon: Icons.menu_book, index: 2, context: context),
          _buildNavItem(icon: Icons.history, index: 3, context: context),
        ],
      ),
    );
  }
}
