import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class KomunitasPage extends StatelessWidget {
  const KomunitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        title: const Text("Komunitas Olahraga"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bergabung dengan komunitas olahraga di Banyumas dan kembangkan semangat sportivitasmu!",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // 🔍 Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Cari komunitas...",
                prefixIcon: const Icon(Icons.search, color: AppTheme.primaryColor),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 🏋️‍♀️ Daftar Komunitas
            _buildCommunityCard(
              context,
              name: "Banyumas Futsal Club",
              members: "230 anggota",
              desc: "Komunitas penggemar futsal dari berbagai kalangan, sering mengadakan sparring dan turnamen internal.",
              imageUrl: "https://images.unsplash.com/photo-1551958219-acbc608c6377",
            ),
            _buildCommunityCard(
              context,
              name: "Runner Banyumas",
              members: "180 anggota",
              desc: "Komunitas lari yang rutin mengadakan fun run dan latihan bersama di Alun-Alun Banyumas setiap minggu pagi.",
              imageUrl: "https://images.unsplash.com/photo-1546483875-ad9014c88eba",
            ),
            _buildCommunityCard(
              context,
              name: "Basket Lovers Purwokerto",
              members: "95 anggota",
              desc: "Tempat berkumpulnya para pecinta basket dari SMA hingga pekerja muda. Ada latihan bareng tiap Rabu malam!",
              imageUrl: "https://images.unsplash.com/photo-1546519638-68e109498ffc",
            ),
            _buildCommunityCard(
              context,
              name: "Badminton Squad Banyumas",
              members: "145 anggota",
              desc: "Komunitas bulu tangkis yang aktif mengadakan kejuaraan antar komunitas di wilayah Banyumas.",
              imageUrl: "https://images.unsplash.com/photo-1605902711622-cfb43c4437d1",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityCard(
    BuildContext context, {
    required String name,
    required String members,
    required String desc,
    required String imageUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 3,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Kamu membuka komunitas: $name")),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(members, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.black87),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.group_add_outlined, size: 18),
                      label: const Text("Gabung Komunitas"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
