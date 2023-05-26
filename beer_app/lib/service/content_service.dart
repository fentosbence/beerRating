import 'package:beer_app/core/provider/beer_provider.dart';
import 'package:beer_app/repository/content_repository.dart';

class ContentService {
  final ContentRepository _contentRepo;
  final BeerProvider _beerProvider;

  ContentService(
    this._contentRepo,
      this._beerProvider,
  );

  Future<void> loadContent() async {
    _beerProvider.beers = await _contentRepo.getBeers();
  }
}
