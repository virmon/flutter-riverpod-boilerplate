import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/data/fake_blocks_repository.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/block.dart';

class BlocksListController
    extends AutoDisposeFamilyAsyncNotifier<List<Block?>, String> {
  @override
  Future<List<Block?>> build(businessId) async {
    return await ref
        .read(blocksRepositoryProvider)
        .fetchBlockByBusinessId(businessId);
  }
}

final blocksListControllerProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      BlocksListController,
      List<Block?>,
      String
    >(BlocksListController.new);
