import 'package:flutter/material.dart';
import '../../app_theme.dart';
import 'detail_pengguna_page.dart';

class ManajemenPenggunaPage extends StatelessWidget {
  const ManajemenPenggunaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> penggunaList = [
      {
        'nama': 'Aldy Setiawan',
        'email': 'aldy@gmail.com',
        'role': 'Admin',
      },
      {
        'nama': 'Rizky Maulana',
        'email': 'rizky@gmail.com',
        'role': 'User',
      },
      {
        'nama': 'Dewi Lestari',
        'email': 'dewi@gmail.com',
        'role': 'User',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Manajemen Pengguna",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: penggunaList.length,
                itemBuilder: (context, index) {
                  final pengguna = penggunaList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                        child: Icon(
                          pengguna['role'] == 'Admin'
                              ? Icons.admin_panel_settings
                              : Icons.person,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      title: Text(
                        pengguna['nama']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        pengguna['email']!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: Chip(
                        label: Text(
                          pengguna['role']!,
                          style: TextStyle(
                            color: pengguna['role'] == 'Admin'
                                ? Colors.red
                                : AppTheme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: AppTheme.secondaryColor,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPenggunaPage(
                              nama: pengguna['nama']!,
                              email: pengguna['email']!,
                              role: pengguna['role']!,
                            ),
                          ),
                        );
                      },
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
