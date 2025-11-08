import 'package:flutter/material.dart';
import '../../app_theme.dart';
import 'detail_pesanan_page.dart';

class ManajemenPesananPage extends StatefulWidget {
  const ManajemenPesananPage({Key? key}) : super(key: key);

  @override
  State<ManajemenPesananPage> createState() => _ManajemenPesananPageState();
}

class _ManajemenPesananPageState extends State<ManajemenPesananPage> {
  final List<Map<String, dynamic>> _pesananList = [
    {
      'id': '#ORD-001',
      'nama': 'Aldy',
      'tanggal': '1 Oktober 2025',
      'total': 'Rp 250.000',
      'status': 'Pending',
    },
    {
      'id': '#ORD-002',
      'nama': 'Budi',
      'tanggal': '3 Oktober 2025',
      'total': 'Rp 400.000',
      'status': 'Dikirim',
    },
    {
      'id': '#ORD-003',
      'nama': 'Siti',
      'tanggal': '5 Oktober 2025',
      'total': 'Rp 700.000',
      'status': 'Selesai',
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Dikirim':
        return Colors.blue;
      case 'Selesai':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void _hapusPesanan(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Hapus Pesanan"),
        content: Text("Apakah Anda yakin ingin menghapus pesanan $id?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              setState(() {
                _pesananList.removeWhere((pesanan) => pesanan['id'] == id);
              });
              Navigator.pop(context);
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  void _lihatDetail(Map<String, dynamic> pesanan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPesananPage(pesananId: pesanan['id']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            const Text(
              "Manajemen Pesanan",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 20),

            // TABEL PESANAN
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(
                      AppTheme.primaryColor.withOpacity(0.1),
                    ),
                    columns: const [
                      DataColumn(label: Text("ID Pesanan")),
                      DataColumn(label: Text("Nama Pelanggan")),
                      DataColumn(label: Text("Tanggal")),
                      DataColumn(label: Text("Total")),
                      DataColumn(label: Text("Status")),
                      DataColumn(label: Text("Aksi")),
                    ],
                    rows: _pesananList.map((pesanan) {
                      return DataRow(
                        cells: [
                          DataCell(Text(pesanan['id'])),
                          DataCell(Text(pesanan['nama'])),
                          DataCell(Text(pesanan['tanggal'])),
                          DataCell(Text(pesanan['total'])),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    _getStatusColor(pesanan['status']).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                pesanan['status'],
                                style: TextStyle(
                                  color: _getStatusColor(pesanan['status']),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          DataCell(Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.visibility,
                                    color: Colors.blue),
                                tooltip: "Lihat Detail",
                                onPressed: () => _lihatDetail(pesanan),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.redAccent),
                                tooltip: "Hapus Pesanan",
                                onPressed: () =>
                                    _hapusPesanan(pesanan['id'] as String),
                              ),
                            ],
                          )),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
