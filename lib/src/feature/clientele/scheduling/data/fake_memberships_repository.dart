import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/constants/mock_data.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/membership.dart';
import 'package:flutter_riverpod_boilerplate/src/utils/in_memory_store.dart';

class FakeMembershipsRepository {
  FakeMembershipsRepository();

  final _memberships = InMemoryStore<List<Membership>>(
    mockAppUser.memberships!,
  );

  Future<List<Membership>> fetchMemberships() async {
    return Future.value(_memberships.value);
  }
}

final membershipsRepositoryProvider = Provider<FakeMembershipsRepository>((
  ref,
) {
  return FakeMembershipsRepository();
});

final membershipsListFutureProvider =
    FutureProvider.autoDispose<List<Membership>>((ref) {
      final membershipsRepository = ref.watch(membershipsRepositoryProvider);
      return membershipsRepository.fetchMemberships();
    });
