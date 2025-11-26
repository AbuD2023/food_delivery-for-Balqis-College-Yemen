import 'package:drift/drift.dart';

class Product extends Table {
  // استخدام String id بدلاً من autoIncrement لتتوافق مع ProductEntity
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  TextColumn get imagePath => text()();
  TextColumn get category => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  TextColumn get description => text().nullable()();
  TextColumn get ingredients =>
      text().nullable()(); // سيتم تخزين List<String> كـ JSON string

  @override
  Set<Column> get primaryKey => {id};
}
