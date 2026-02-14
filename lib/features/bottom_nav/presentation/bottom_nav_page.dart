import 'package:flutter/material.dart';
import 'package:quiz_academy/core/theme/app_colors.dart';
import 'package:quiz_academy/features/home/presentation/pages/home_page.dart';
import 'package:quiz_academy/features/profile/presentation/pages/profile_page.dart';
import 'package:quiz_academy/features/results_history/presentation/pages/result_history_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ResultsHistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        showUnselectedLabels: true,

        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Results',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}

