import 'consumer.dart';
import 'product_in_warehouse.dart';
import 'provider.dart';

/*** Bài toán người sản xuất, người tiêu dùng với bộ đệm hạn chế:

    - Người sản xuất: tạo ra sản phẩm, xếp nó vào 1 chỗ gọi là bộ đệm, mỗi lần 1 sản phẩm
    - Người tiêu dùng: lấy sản phẩm từ bộ đệm, mỗi lần 1 sản phẩm, để sử dụng
    - Dung lượng bộ đệm hạn chế, chứa tối đa N sản phẩm
    - 3 yêu cầu đồng bộ:
    - Người sản xuất và tiêu dùng không được sử dụng bộ đệm cùng lúc
    - Khi bộ đệm rỗng, người tiêu dùng không nên cố lấy sản phẩm
    - Khi bộ đệm đầy, người sản xuất không được thêm sản phẩm
 ***/

void main() {
  ProductInWarehouse productInWarehouse = ProductInWarehouse();

  Provider provider = Provider(productInWarehouse);
  Consumer consumer = Consumer(productInWarehouse);

  provider.produce(5);
  provider.produce(3);
  provider.produce(2);
  consumer.consume(1);
  consumer.consume(6);
  consumer.consume(4);
}