import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app_theme.dart';
import 'cart_provider.dart';
import 'pesanan_berhasil_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: cart.cartItems.map((item) {
                  return ListTile(
                    leading: Image.asset(item["image"], width: 50),
                    title: Text(item["title"]),
                    subtitle: Text(
                        "Rp ${item["price"].toStringAsFixed(0)} x ${item["qty"]}"),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Total: Rp ${cart.totalPrice.toStringAsFixed(0)}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
              ),
              onPressed: () {
                cart.clearCart();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PesananBerhasilPage()),
                );
              },
              child: const Text(
                "Konfirmasi Pembayaran",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
