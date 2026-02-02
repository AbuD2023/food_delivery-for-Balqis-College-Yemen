// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dao.dart';

// ignore_for_file: type=lint
mixin _$CartDaoMixin on DatabaseAccessor<AppDatabase> {
  $CartTable get cart => attachedDatabase.cart;
  CartDaoManager get managers => CartDaoManager(this);
}

class CartDaoManager {
  final _$CartDaoMixin _db;
  CartDaoManager(this._db);
  $$CartTableTableManager get cart =>
      $$CartTableTableManager(_db.attachedDatabase, _db.cart);
}
