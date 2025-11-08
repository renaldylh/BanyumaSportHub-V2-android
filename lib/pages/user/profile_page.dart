import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <== Untuk keluar aplikasi
import '../../../app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false, // 
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🧍‍♀️ Header profil
            Container(
              width: double.infinity,
              color: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/user_avatar.png'),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Noviana Lestari",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "noviana.lestari@gmail.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // ⚙️ Menu pengaturan profil
            _buildProfileOption(
              icon: Icons.person_outline_rounded,
              title: "Edit Profil",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.lock_outline_rounded,
              title: "Ubah Kata Sandi",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.history_rounded,
              title: "Riwayat Pemesanan",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.notifications_outlined,
              title: "Notifikasi",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.help_outline_rounded,
              title: "Pusat Bantuan",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.info_outline_rounded,
              title: "Tentang Aplikasi",
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),

            const SizedBox(height: 30),

            // 🚪 Tombol logout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: const Text("Keluar dari Akun"),
                      content: const Text(
                        "Pilih tindakan yang ingin kamu lakukan:",
                        style: TextStyle(fontSize: 14),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Batal"),
                        ),

                        // 🔁 Kembali ke Role Selection
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/role-selection',
                              (route) => false,
                            );
                          },
                          child: const Text(
                            "Kembali ke Role Selection",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),

                        // ❌ Keluar dari aplikasi
                        ElevatedButton(
                          onPressed: () {
                            SystemNavigator.pop(); // Tutup aplikasi
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                          ),
                          child: const Text("Keluar Aplikasi"),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.primaryColor,
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppTheme.primaryColor),
                  ),
                ),
                icon: const Icon(Icons.logout_rounded),
                label: const Text(
                  "Keluar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🔧 Widget untuk item menu profil
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: AppTheme.primaryColor),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }
}
