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
    _beerProvider.updateBeers(await _contentRepo.getBeers());
  }

  Future<void> searchBeers(String category) async {
    _beerProvider.updateBeers(await _contentRepo.getBeersByCategory(category));
  }

  Future<void> sendVote(int id, int newValue) async {
    await _contentRepo.sendVote(id, newValue);
    _beerProvider.updateRatings(id, newValue);
  }
}
