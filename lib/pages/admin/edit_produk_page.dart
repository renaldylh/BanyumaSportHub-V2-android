import 'package:flutter/material.dart';
import '../../app_theme.dart';

class EditProdukPage extends StatefulWidget {
  final String produkId;
  final String namaProduk;
  final String harga;
  final String stok;
  final String deskripsi;

  const EditProdukPage({
    Key? key,
    required this.produkId,
    required this.namaProduk,
    required this.harga,
    required this.stok,
    required this.deskripsi,
  }) : super(key: key);

  @override
  State<EditProdukPage> createState() => _EditProdukPageState();
}

class _EditProdukPageState extends State<EditProdukPage> {
  late TextEditingController _namaController;
  late TextEditingController _hargaController;
  late TextEditingController _stokController;
  late TextEditingController _deskripsiController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.namaProduk);
    _hargaController = TextEditingController(text: widget.harga);
    _stokController = TextEditingController(text: widget.stok);
    _deskripsiController = TextEditingController(text: widget.deskripsi);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    _stokController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        title: const Text("Edit Produk"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Nama Produk"),
              _buildInputField(_namaController, "Masukkan nama produk"),
              const SizedBox(height: 16),
              _buildLabel("Harga"),
              _buildInputField(_hargaController, "Masukkan harga produk",
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              _buildLabel("Stok"),
              _buildInputField(_stokController, "Masukkan jumlah stok",
                  keyboardType: TextInputType.number),
              const SizedBox(height: 16),
              _buildLabel("Deskripsi"),
              _buildInputField(
                _deskripsiController,
                "Masukkan deskripsi produk",
                maxLines: 4,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Produk berhasil diperbarui!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text("Simpan Perubahan"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppTheme.primaryColor,
        fontSize: 15,
      ),
    );
  }

  Widget _buildInputField(
    TextEditingController controller,
    String hintText, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
        ),
      ),
    );
  }
}
