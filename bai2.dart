import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ================= MÀN HÌNH MENU CHÍNH =================
class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Bài Tập')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Bai1Screen())),
              child: const Text('Bài 1: Giao diện Thông tin cá nhân'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Bai2Screen())),
              child: const Text('Bài 2: Form Đăng nhập'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Bai3Screen())),
              child: const Text('Bài 3: Danh sách môn học'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Bai4Screen())),
              child: const Text('Bài 4: Profile có Tab (Fragment)'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Bai5HomeScreen())),
              child: const Text('Bài 5: Quản lý lớp học (Mini Project)'),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= BÀI 1: THÔNG TIN CÁ NHÂN =================
class Bai1Screen extends StatelessWidget {
  const Bai1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 1: Thông tin cá nhân')),
      // Padding tương đương margin bao quanh
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // Column tương đương LinearLayout (vertical)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200'), // Ảnh đại diện
            ),
            const SizedBox(height: 16),
            const Text('Nguyễn Mạnh Hùng', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Lớp: IT-K15', style: TextStyle(fontSize: 16)),
            const Text('Email: hung@example.com', style: TextStyle(fontSize: 16)),
            const Text('SĐT: 0123456789', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Chỉnh sửa')),
                OutlinedButton(onPressed: () {}, child: const Text('Liên hệ')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ================= BÀI 2: FORM ĐĂNG NHẬP =================
class Bai2Screen extends StatelessWidget {
  const Bai2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bài 2: Đăng nhập')),
      // Trong Flutter, cấu trúc Column có padding tốt tạo ra UI tương đương ConstraintLayout về độ linh hoạt
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FlutterLogo(size: 100),
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (bool? value) {}),
                  const Text('Ghi nhớ đăng nhập'),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Đăng nhập', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Đăng ký', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= BÀI 3: DANH SÁCH MÔN HỌC =================
class Bai3Screen extends StatelessWidget {
  const Bai3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả lập
    final subjects = List.generate(6, (index) => {
      'name': 'Môn học cơ sở ${index + 1}',
      'credits': '${(index % 3) + 2} tín chỉ',
      'teacher': 'Giảng viên Nguyễn Văn ${String.fromCharCode(65 + index)}'
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Bài 3: Môn học')),
      // SingleChildScrollView tương đương ScrollView
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: subjects.map((subject) {
            // Card tương đương CardView, có sẵn bo góc và shadow
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subject['name']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Số tín chỉ: ${subject['credits']}'),
                    Text('Giảng viên: ${subject['teacher']}'),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {}, child: const Text('Xem chi tiết')),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ================= BÀI 4: PROFILE CÓ TAB (Tương đương Fragment) =================
class Bai4Screen extends StatelessWidget {
  const Bai4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController giúp quản lý Tab mà không cần tạo Activity/Screen mới
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bài 4: Profile'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Thông tin', icon: Icon(Icons.person)),
              Tab(text: 'Lịch sử', icon: Icon(Icons.history)),
              Tab(text: 'Cài đặt', icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: Column(
          children: [
            // Phần Header cố định
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: Colors.deepPurple.shade50,
              child: const Column(
                children: [
                  CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                  SizedBox(height: 12),
                  Text('Nguyễn Mạnh Hùng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            // Phần nội dung thay đổi theo Tab (Tương đương thay đổi Fragment)
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Nội dung trang Thông tin cá nhân', style: TextStyle(fontSize: 16))),
                  Center(child: Text('Nội dung trang Lịch sử hoạt động', style: TextStyle(fontSize: 16))),
                  Center(child: Text('Nội dung trang Cài đặt hệ thống', style: TextStyle(fontSize: 16))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= BÀI 5: QUẢN LÝ LỚP HỌC (MINI PROJECT) =================
// Màn hình 1: Trang chủ
class Bai5HomeScreen extends StatelessWidget {
  const Bai5HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý lớp học')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // GridView tương đương GridLayout
        child: GridView.count(
          crossAxisCount: 2, // 2 cột
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildGridItem(context, 'Sinh viên', Icons.people, Colors.blue, const Bai5StudentListScreen()),
            _buildGridItem(context, 'Giảng viên', Icons.school, Colors.green, null),
            _buildGridItem(context, 'Môn học', Icons.book, Colors.orange, null),
            _buildGridItem(context, 'Thống kê', Icons.bar_chart, Colors.red, null),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData icon, Color color, Widget? nextScreen) {
    return InkWell(
      onTap: () {
        if (nextScreen != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => nextScreen));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Chức năng $title chưa hỗ trợ')));
        }
      },
      child: Card(
        color: color.withOpacity(0.1),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: color.withOpacity(0.5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}

// Màn hình 2: Danh sách sinh viên
class Bai5StudentListScreen extends StatelessWidget {
  const Bai5StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách sinh viên')),
      body: ListView.builder( // Dùng ListView hiệu quả hơn ScrollView + Column cho danh sách dài
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text('Sinh viên ${index + 1}'),
              subtitle: const Text('Lớp: IT-K15'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Bai5AddStudentScreen())),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Màn hình 3: Thêm sinh viên
class Bai5AddStudentScreen extends StatelessWidget {
  const Bai5AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm sinh viên')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Họ tên', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Ngày sinh', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Lớp', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context), // Giả lập lưu thành công và quay lại
                  child: const Text('Lưu thông tin'),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context), // Hủy và quay lại
                  child: const Text('Hủy'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}