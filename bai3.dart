import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView & RecyclerView in Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ================= MÀN HÌNH CHÍNH (Chứa Bottom Navigation) =================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Danh sách các màn hình tương ứng với 2 yêu cầu
  final List<Widget> _screens = [
    const ProductListScreen(), // Yêu cầu 1 (RecyclerView)
    const SubjectManagerScreen(), // Yêu cầu 2 (ListView)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sản phẩm (Recycler)',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Môn học (List)',
          ),
        ],
      ),
    );
  }
}

// ================= YÊU CẦU 1: DANH SÁCH SẢN PHẨM (Tương đương RecyclerView) =================
// Lớp dữ liệu cho Sản phẩm
class Product {
  final String name;
  final int price;
  final String description;

  Product(this.name, this.price, this.description);
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả lập (tương đương ArrayList trong yêu cầu)
    final List<Product> productList = [
      Product('Laptop MSI Katana', 25000000, 'Laptop gaming cấu hình cao, card RTX 4060.'),
      Product('Bàn phím cơ', 1500000, 'Bàn phím cơ switch Red tĩnh âm.'),
      Product('Chuột Logitech', 800000, 'Chuột không dây form công thái học.'),
      Product('Màn hình 24 inch', 3000000, 'Màn hình IPS 144Hz chuyên game.'),
      Product('Tai nghe Bluetooth', 1200000, 'Tai nghe chống ồn chủ động.'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách Sản phẩm')),
      // ListView.builder thay thế hoàn hảo cho RecyclerView + Adapter
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          // Giao diện cho từng Item (Tương đương file item_product.xml)
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const Icon(Icons.devices, size: 40, color: Colors.blue),
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('Giá: ${product.price} VNĐ', style: const TextStyle(color: Colors.red)),
                  Text(product.description),
                ],
              ),
              onTap: () {
                // Hiển thị thông báo (Tương đương Toast)
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Bạn đã chọn: ${product.name}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ================= YÊU CẦU 2: QUẢN LÝ MÔN HỌC (Tương đương ListView) =================
class SubjectManagerScreen extends StatefulWidget {
  const SubjectManagerScreen({super.key});

  @override
  State<SubjectManagerScreen> createState() => _SubjectManagerScreenState();
}

class _SubjectManagerScreenState extends State<SubjectManagerScreen> {
  final List<String> _subjects = []; // ArrayList lưu danh sách môn
  final TextEditingController _controller = TextEditingController();

  // Hàm thêm môn học
  void _addSubject() {
    final newSubject = _controller.text.trim();
    if (newSubject.isEmpty) {
      // Yêu cầu: Báo lỗi nếu chưa nhập dữ liệu
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên môn học hợp lệ!', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() {
      _subjects.add(newSubject);
      _controller.clear(); // Xóa trắng ô nhập sau khi thêm
    });
  }

  // Hàm xóa tất cả
  void _clearAll() {
    setState(() {
      _subjects.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Môn học')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Cụm Input và Nút bấm
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nhập tên môn học',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _addSubject,
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 18)),
                  child: const Text('Thêm'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _clearAll,
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text('Xóa tất cả', style: TextStyle(color: Colors.red)),
              ),
            ),
            const Divider(height: 30, thickness: 2),
            // Danh sách môn học hiển thị (Tương đương ListView)
            Expanded(
              child: _subjects.isEmpty
                  ? const Center(child: Text('Danh sách môn học đang trống'))
                  : ListView.builder(
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(_subjects[index], style: const TextStyle(fontSize: 16)),
                      onTap: () {
                        // Yêu cầu: Click vào để Toast tên môn
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Môn học: ${_subjects[index]}')),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}