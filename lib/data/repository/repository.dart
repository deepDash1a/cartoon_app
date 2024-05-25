import 'package:cartoon_app/data/model/model.dart';
import 'package:cartoon_app/data/web_services/web_services.dart';

class CharacterRepository {
  final CharacterWebService characterWebService;

  CharacterRepository({required this.characterWebService});

  Future<List<Character>> getAllCharacters() async {
    final character = await characterWebService.getAllCharacters();
    return character;
  }
}
