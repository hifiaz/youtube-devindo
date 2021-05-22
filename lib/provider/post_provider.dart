import 'package:crud_jsonplaceholder/model/post_model.dart';
import 'package:crud_jsonplaceholder/provider/general_provider.dart';
import 'package:crud_jsonplaceholder/service/data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvide =
    StateNotifierProvider<PostProvider, AsyncValue<List<PostModel>>>((ref) {
  final serviceData = ref.read(dataService);
  return PostProvider(serviceData);
});

class PostProvider extends StateNotifier<AsyncValue<List<PostModel>>> {
  PostProvider(this._serviceData, [AsyncValue<List<PostModel>>? state])
      : super(AsyncValue.data([])) {
    getReadPost();
  }

  final DataService? _serviceData;

  Future<void> getReadPost() async {
    state = AsyncValue.loading();
    final posts = await _serviceData!.readPost();
    if (mounted) {
      state = AsyncValue.data([...posts]);
    }
  }

  Future createReadPost(PostModel post) async {
    // state = AsyncValue.loading();
    final posts = await _serviceData!.createPost(post);
    return posts;
  }

  Future editReadPost(PostModel post) async {
    final posts = await _serviceData!.editPost(post);
    return posts;
  }
}
