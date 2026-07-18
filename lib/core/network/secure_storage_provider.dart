import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pooja_sindhu/core/storage/secure_storage_service.dart';

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});
