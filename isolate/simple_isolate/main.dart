import 'dart:isolate';

// Hàm chạy trên Isolate để tính tổng từ 1 đến n
void computeSum(SendPort sendPort) {
  int sum = 0;
  for (int i = 1; i <= 100000000; i++) {
    sum += i;
  }
  sendPort.send(sum); // Gửi kết quả về Isolate chính
}

void main() async {
  // Tạo ReceivePort để nhận kết quả từ Isolate
  ReceivePort receivePort = ReceivePort();

  // Khởi động Isolate và truyền SendPort của ReceivePort
  await Isolate.spawn(computeSum, receivePort.sendPort);

  // Nhận kết quả từ Isolate
  receivePort.listen((message) {
    print("✅ Tổng từ 1 đến 100 triệu: $message");
    receivePort.close();
  });

  print("⌛ Đang tính toán trên Isolate...");
}
