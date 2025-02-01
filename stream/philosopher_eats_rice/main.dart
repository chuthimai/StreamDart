import 'chopstick.dart';
import 'person.dart';

/**
 * 5 triết gia ngồi trên ghế quanh 1 bàn tròn

    - Trên bàn có 5 cái đũa: bên phải và bên trái mỗi người có 1 cái
    - Triết gia có thể nhặt 2 chiếc đũa theo thứ tự bất kì: phải nhặt từng
    chiếc một và đũa không nằm trong tay người khác
    - Khi cầm được cả 2 đũa: triết gia bắt đầu ăn và không đặt đũa trong
    thời gian ăn
    - Sau khi ăn xong, triết gia đặt 2 đũa xuống bàn
    - => 5 triết gia như 5 tiến trình đồng thời với tài nguyên nguy hiểm là đũa
    và đoạn nguy hiểm là đoạn dùng đũa để ăn
    - Cờ hiệu cho phép giải quyết bài toán như sau:
    • Mỗi đũa được biểu diễn bằng 1 cờ hiệu
    • Nhặt đũa: wait(); đặt đũa xuống: signal()
 */

void main() {
  Chopstick chopstick1 = Chopstick("Chopstick 1");
  Chopstick chopstick2 = Chopstick("Chopstick 2");
  Chopstick chopstick3 = Chopstick("Chopstick 3");
  Chopstick chopstick4 = Chopstick("Chopstick 4");
  Chopstick chopstick5 = Chopstick("Chopstick 5");

  Person person1 = Person("Person 1");
  Person person2 = Person("Person 2");
  Person person3 = Person("Person 3");
  Person person4 = Person("Person 4");
  Person person5 = Person("Person 5");

  Future.delayed(Duration.zero, () async {
    await Future.wait([
      person1.eat(chopstick1, chopstick2),
      person3.eat(chopstick3, chopstick4)
    ]);
    await Future.wait([
      person2.eat(chopstick2, chopstick3),
      person4.eat(chopstick4, chopstick5),
    ]);
    await person5.eat(chopstick5, chopstick1);
  });
}