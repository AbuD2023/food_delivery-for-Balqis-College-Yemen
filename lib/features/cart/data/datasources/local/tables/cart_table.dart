import 'package:drift/drift.dart';

class Cart extends Table {
  // استخدام productId كـ primary key لأن كل منتج يجب أن يكون مرة واحدة فقط في السلة
  TextColumn get productId => text()();
  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {productId};
}
