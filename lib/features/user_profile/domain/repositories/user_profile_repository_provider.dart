import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/user_profile/data/data.dart';
import 'package:quote_generator/features/user_profile/domain/domain.dart';

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  final remoteDataSource = ref.watch(userProfileRemoteDatasourceProvider);
  return UserProfileRepositoryImpl(remoteDataSource);
});
