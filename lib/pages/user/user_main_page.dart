import 'package:flutter/material.dart';
import 'beranda_page.dart';
import 'lapangan_page.dart';
import 'event_page.dart';
import 'komunitas_page.dart';
import 'profile_page.dart';
import 'marketplace/marketplace_page.dart';

class UserMainPage extends StatefulWidget {
  const UserMainPage({super.key});

  @override
  State<UserMainPage> createState() => _UserMainPageState();
}

class _UserMainPageState extends State<UserMainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    BerandaPage(),
    LapanganPage(),
    EventPage(),
    MarketplacePage(), // ✅ ini sekarang berhasil karena path import sudah benar
    KomunitasPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer_rounded), label: 'Lapangan'),
          BottomNavigationBarItem(icon: Icon(Icons.event_rounded), label: 'Event'),
          BottomNavigationBarItem(icon: Icon(Icons.store_rounded), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_rounded), label: 'Komunitas'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
        ],
      ),
    );
  }
}
