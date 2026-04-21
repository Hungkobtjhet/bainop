void main() {
  bai1();
  bai2();
  bai3();
  bai4();
  bai5();
  bai6();
  bai7();
  bai8();
  bai9();
  bai10();
}
void bai1() {
  print("Bài 1");
  const String tenSinhVien = "Nguyễn Văn A";
  final int tuoi = 20;
  var diemTrungBinh = 8.5;
  bool trangThaiTotNghiep = false;

  print("Tên: $tenSinhVien | Tuổi: $tuoi | GPA: $diemTrungBinh | Tốt nghiệp: $trangThaiTotNghiep\n");
}
void bai2() {
  print("Bài 2");
  int a = 15;
  double b = 4.5;
  print("Cộng: ${a + b} | Trừ: ${a - b} | Nhân: ${a * b} | Chia: ${a / b}\n");
}
void bai3() {
  print("Bài 3");
  String hoTen = "Trần Thị B";
  double diem = 7.5;
  bool isPassed = diem >= 5;
  print("Sinh viên $hoTen: ${isPassed ? 'Đậu' : 'Rớt'}\n");
}
void bai4() {
  print("Bài 4");
  List<int> numbers = [12, 45, 7, 89, 34];
  int sum = 0;
  for (var n in numbers) sum += n;
  print("List: $numbers | Đầu: ${numbers.first} | Cuối: ${numbers.last} | Tổng: $sum\n");
}
void bai5() {
  print("Bài 5");
  Map<String, dynamic> sv = {"name": "Lê Văn C", "age": 21, "gpa": 3.8};
  print("Toàn bộ Map: $sv");
  print("Tên: ${sv['name']}, GPA: ${sv['gpa']}\n");
}
void hello() => print("Hello Dart");

void bai6() {
  print("Bài 6");
  hello();
  print("");
}
int tinhTong(int a, int b) {
  return a + b;
}
void bai7() {
  print("Bài 7");
  print("Tổng 25 + 40 = ${tinhTong(25, 40)}\n");
}
int tinhTongArrow(int a, int b) => a + b;
void bai8() {
  print("Bài 8");
  print("Tổng (Arrow) 100 + 200 = ${tinhTongArrow(100, 200)}\n");
}
int tinhTongList(List<int> list) {
  int s = 0;
  for (var i in list) s += i;
  return s;
}
void bai9() {
  print("Bài 9");
  List<int> ds = [1, 2, 3, 4, 5];
  print("Tổng danh sách $ds là: ${tinhTongList(ds)}\n");
}
class SinhVien {
  String name;
  int age;
  double gpa;
  SinhVien(this.name, this.age, this.gpa);
  void hienThi() => print("SV: $name | $age tuổi | GPA: $gpa");
}
void bai10() {
  print("Bài 10");
  SinhVien sv1 = SinhVien("Phạm D", 19, 8.2);
  SinhVien sv2 = SinhVien("Hoàng E", 20, 9.0);
  sv1.hienThi();
  sv2.hienThi();
}