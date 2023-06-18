import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/auth/auth.dart';

final authRepositorProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});
