import 'package:audio_player/databases/database.dart';

import 'package:audio_player/main.dart';
import 'package:audio_player/services/services.dart';

class BestAlbumsPaginationService {
  bool _isLoading = false;

  final BestAlbumRepository _bestAlbumsRepository =
      BestAlbumRepository(MyDatabaseSingleton.instance);
  final int _perPage = 10;
  int _page = 1;

  List<BestAlbum> items = [];

  bool get isLoading => _isLoading;

  Future<void> loadMoreItems() async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final newPortion =
          await _bestAlbumsRepository.getBestAlbums(_perPage, _page);

      items.addAll(newPortion);
      _page += 1;
      print(_page);
    } finally {
      _isLoading = false;
    }
  }
}
