import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'tables/product_table.dart';
import 'daos/product_dao.dart';
import 'seed_data.dart';

part 'drift_database.g.dart';

@DriftDatabase(tables: [Product], daos: [ProductDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// تهيئة قاعدة البيانات بالبيانات الأولية (تُستدعى مرة واحدة فقط)
  Future<void> seedInitialData() async {
    // التحقق من وجود بيانات في الجدول
    final existingProducts = await productDao.getAllProducts();

    // إذا كان الجدول فارغاً، أضف البيانات الأولية
    if (existingProducts.isEmpty) {
      final initialProducts = SeedData.getInitialProducts();
      for (final product in initialProducts) {
        await productDao.insertProduct(product);
      }
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    log(dbFolder.path, name: 'dbFolder');
    final file = File(p.join(dbFolder.path, 'app_db.sqlite'));
    return NativeDatabase(file);
  });
}
