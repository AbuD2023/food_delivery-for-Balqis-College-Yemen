import 'package:flutter/material.dart';

enum DataSource {
  remote, // من API
  local, // من Local Storage
}

extension DataSourceExtension on DataSource {
  String get displayName {
    switch (this) {
      case DataSource.remote:
        return 'سحابي';
      case DataSource.local:
        return 'محلي';
    }
  }

  Color get color {
    switch (this) {
      case DataSource.remote:
        return Colors.green;
      case DataSource.local:
        return Colors.orange;
    }
  }

  IconData get icon {
    switch (this) {
      case DataSource.remote:
        return Icons.cloud_done;
      case DataSource.local:
        return Icons.storage;
    }
  }
}
