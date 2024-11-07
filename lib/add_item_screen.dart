import 'package:flutter/material.dart';
import 'add_item_form.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Menu List',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  // Align children to start
        children: [
          // Add Data Button
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),  // Left padding only
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddItemForm()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Data +',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Table Header
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),  // Horizontal padding
            child: Row(
              children: const [
                SizedBox(width: 60, child: Text('Foto', style: TextStyle(fontSize: 12))),
                Expanded(child: Text('Nama Produk', style: TextStyle(fontSize: 12))),
                SizedBox(width: 80, child: Text('Harga', style: TextStyle(fontSize: 12))),
                SizedBox(width: 50, child: Text('Aksi', style: TextStyle(fontSize: 12))),
              ],
            ),
          ),
          const Divider(),
          // List Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),  // Horizontal padding
              children: [
                _buildMenuItemTable(
                  'Double Patty Medium',
                  'Rp 55.000',
                  'assets/burger_icon.jpeg',
                  context,
                ),
                _buildMenuItemTable(
                  'Tea botol',
                  'Rp 4.000',
                  'assets/drink_icon.jpeg',
                  context,
                ),
                _buildMenuItemTable(
                  'Burger King Small',
                  'Rp 35.000',
                  'assets/Burger_Chicken.jpeg',
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemTable(String name, String price, String imagePath, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Name
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          // Price
          SizedBox(
            width: 80,
            child: Text(
              price,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          // Delete button
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.delete_outline,
                color: Colors.red[400],
                size: 18,
              ),
              onPressed: () {
                // Add delete function here
              },
            ),
          ),
        ],
      ),
    );
  }
}