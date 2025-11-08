import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import 'lapangan_page.dart';
import 'event_page.dart';
import 'artikel_page.dart';
import 'marketplace/marketplace_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false, 
        title: const Text(
          "Banyumas SportHub",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // === BODY ===
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👋 Salam pengguna
            const Text(
              "Selamat datang, Atlet Banyumas! 🏅",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Temukan aktivitas olahraga favoritmu di sekitar Banyumas.",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            const SizedBox(height: 20),

            // 🔍 Pencarian
            TextField(
              decoration: InputDecoration(
                hintText: "Cari lapangan, event, atau artikel...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 🏟️ Kategori utama
            const Text(
              "Kategori Utama",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(Icons.sports_soccer, "Lapangan", context, const LapanganPage()),
                _buildCategoryIcon(Icons.event, "Event", context, const EventPage()),
                _buildCategoryIcon(Icons.shopping_bag, "Marketplace", context, const MarketplacePage()),
                _buildCategoryIcon(Icons.article, "Artikel", context, const ArtikelPage()),
              ],
            ),
            const SizedBox(height: 30),

            // 🏅 Event terdekat
            const Text(
              "Event Olahraga Terdekat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildEventCard(context, "Fun Run Banyumas", "20 Okt 2025", "Purwokerto"),
                  _buildEventCard(context, "Turnamen Futsal", "23 Okt 2025", "Gor Satria"),
                  _buildEventCard(context, "Zumba Day", "29 Okt 2025", "Alun-Alun Banyumas"),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 🏋️ Artikel Olahraga
            const Text(
              "Artikel Olahraga Populer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                _buildArticleCard(
                  context,
                  "Tips Menjaga Kebugaran Tubuh",
                  "Baca berbagai cara agar tetap bugar setiap hari.",
                ),
                _buildArticleCard(
                  context,
                  "5 Lapangan Futsal Terbaik di Banyumas",
                  "Rekomendasi tempat bermain futsal favorit!",
                ),
                _buildArticleCard(
                  context,
                  "Kenali Komunitas Lari Purwokerto",
                  "Gabung dan tingkatkan semangat olahraga bareng!",
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // === Widget kategori (klik bisa pindah halaman) ===
  Widget _buildCategoryIcon(
      IconData icon, String label, BuildContext context, Widget page) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 32),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // === Widget event (klik tombol ke halaman Event) ===
  Widget _buildEventCard(
      BuildContext context, String title, String date, String location) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(date, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EventPage()),
                );
              },
              child: const Text(
                "Lihat Detail →",
                style: TextStyle(color: AppTheme.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === Widget artikel (klik ke halaman Artikel) ===
  Widget _buildArticleCard(
      BuildContext context, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,
            color: AppTheme.primaryColor, size: 18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ArtikelPage()),
          );
        },
      ),
    );
  }
}
