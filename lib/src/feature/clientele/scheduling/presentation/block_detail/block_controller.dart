import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/data/fake_blocks_repository.dart';
import 'package:flutter_riverpod_boilerplate/src/feature/clientele/scheduling/domain/block.dart';

class BlockController extends AutoDisposeFamilyAsyncNotifier<Block?, String> {
  Block? block;
  @override
  Future<Block?> build(blockId) async {
    return await ref.read(blocksRepositoryProvider).fetchBlockById(blockId);
  }
}

final blockControllerProvider =
    AutoDisposeAsyncNotifierProviderFamily<BlockController, Block?, String>(
      BlockController.new,
    );
