import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class LapanganPage extends StatelessWidget {
  const LapanganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        title: const Text("Daftar Lapangan"),
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
              "Temukan dan pesan lapangan olahraga favoritmu dengan mudah!",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // 🔍 Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Cari lapangan...",
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

            // 🏟️ Daftar Lapangan
            _buildLapanganCard(
              context,
              name: "Gor Satria Purwokerto",
              type: "Basket • Futsal",
              price: "Rp 120.000 / jam",
              address: "Jl. Prof. Dr. Suharso, Purwokerto",
              imageUrl: "https://images.unsplash.com/photo-1546519638-68e109498ffc",
            ),
            _buildLapanganCard(
              context,
              name: "Lapangan Sepak Bola Kedungwuluh",
              type: "Sepak Bola",
              price: "Rp 200.000 / jam",
              address: "Kedungwuluh, Banyumas",
              imageUrl: "https://images.unsplash.com/photo-1517649763962-0c623066013b",
            ),
            _buildLapanganCard(
              context,
              name: "Badminton Arena Banyumas",
              type: "Bulu Tangkis",
              price: "Rp 80.000 / jam",
              address: "Jl. Gatot Subroto, Banyumas",
              imageUrl: "https://images.unsplash.com/photo-1605902711622-cfb43c4437d1",
            ),
            _buildLapanganCard(
              context,
              name: "Lapangan Voli Karanglewas",
              type: "Voli",
              price: "Rp 90.000 / jam",
              address: "Karanglewas, Banyumas",
              imageUrl: "https://images.unsplash.com/photo-1531327431072-75a93572ed5c",
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Widget Card Lapangan
  Widget _buildLapanganCard(
    BuildContext context, {
    required String name,
    required String type,
    required String price,
    required String address,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      shadowColor: Colors.black26,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Gambar Lapangan
            Image.network(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // 📋 Detail Lapangan
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(type, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blueGrey, size: 18),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          address,
                          style: const TextStyle(color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Pesan lapangan: $name")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Pesan"),
                      ),
                    ],
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
