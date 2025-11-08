import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app_theme.dart';
import 'cart_provider.dart';
import 'keranjang_page.dart';

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "title": "Sepatu Futsal Nike ZoomX",
        "price": 899000.0,
        "image": "assets/images/shoes.png",
      },
      {
        "title": "Raket Badminton Yonex",
        "price": 450000.0,
        "image": "assets/images/racket.png",
      },
      {
        "title": "Bola Sepak Adidas",
        "price": 350000.0,
        "image": "assets/images/ball.png",
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        title: const Text("Marketplace"),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false, // ✅ Hilangkan tombol back
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const KeranjangPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 260,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(context, product);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(product["image"], height: 120, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product["title"],
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Rp ${product["price"].toStringAsFixed(0)}",
            style: const TextStyle(color: AppTheme.primaryColor),
          ),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addToCart(
                product["title"],
                product["price"],
                product["image"],
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${product["title"]} ditambahkan ke keranjang")),
              );
            },
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text("Tambah"),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
