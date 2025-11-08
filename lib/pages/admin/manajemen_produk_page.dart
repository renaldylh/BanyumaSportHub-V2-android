import 'package:flutter/material.dart';
import '../../app_theme.dart';
import 'edit_produk_page.dart';
import 'tambah_produk_page.dart';

class ManajemenProdukPage extends StatefulWidget {
  const ManajemenProdukPage({Key? key}) : super(key: key);

  @override
  State<ManajemenProdukPage> createState() => _ManajemenProdukPageState();
}

class _ManajemenProdukPageState extends State<ManajemenProdukPage> {
  final List<Map<String, dynamic>> _produkList = [
    {
      'id': 'P001',
      'nama': 'Sepatu Futsal Adidas',
      'harga': '350000',
      'stok': '12',
      'deskripsi': 'Sepatu ringan dan nyaman untuk bermain futsal.'
    },
    {
      'id': 'P002',
      'nama': 'Raket Badminton Yonex',
      'harga': '420000',
      'stok': '8',
      'deskripsi': 'Raket dengan bahan karbon yang kuat dan ringan.'
    },
    {
      'id': 'P003',
      'nama': 'Bola Basket Molten',
      'harga': '270000',
      'stok': '20',
      'deskripsi': 'Bola basket standar FIBA dengan grip kuat.'
    },
  ];

  void _tambahProduk() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );
  }

  void _editProduk(Map<String, dynamic> produk) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProdukPage(
          produkId: produk['id'],
          namaProduk: produk['nama'],
          harga: produk['harga'],
          stok: produk['stok'],
          deskripsi: produk['deskripsi'],
        ),
      ),
    );
  }

  void _hapusProduk(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Hapus"),
        content: const Text("Apakah Anda yakin ingin menghapus produk ini?"),
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
                _produkList.removeWhere((p) => p['id'] == id);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Produk berhasil dihapus!"),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Text("Hapus"),
          ),
        ],
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
          children: [
            // HEADER BAR + BUTTON TAMBAH
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Manajemen Produk",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _tambahProduk,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    "Tambah Produk",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // TABLE PRODUK
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
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Nama Produk")),
                      DataColumn(label: Text("Harga")),
                      DataColumn(label: Text("Stok")),
                      DataColumn(label: Text("Deskripsi")),
                      DataColumn(label: Text("Aksi")),
                    ],
                    rows: _produkList.map((produk) {
                      return DataRow(
                        cells: [
                          DataCell(Text(produk['id'])),
                          DataCell(Text(produk['nama'])),
                          DataCell(Text("Rp ${produk['harga']}")),
                          DataCell(Text(produk['stok'])),
                          DataCell(
                            SizedBox(
                              width: 200,
                              child: Text(
                                produk['deskripsi'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: AppTheme.primaryColor),
                                  onPressed: () => _editProduk(produk),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () => _hapusProduk(produk['id']),
                                ),
                              ],
                            ),
                          ),
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
