import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> sharedPreferences(ref) async {
  return await SharedPreferences.getInstance();
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

final userDataProvider = FutureProvider<bool>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  bool? hasAdminPrivilege = prefs.getBool('hasAdminPrivilege');
  if (hasAdminPrivilege == null) {
    final isAdmin = false;
    await prefs.setBool('hasAdminPrivilege', isAdmin);
    return isAdmin;
  } else {
    return hasAdminPrivilege;
  }
});
