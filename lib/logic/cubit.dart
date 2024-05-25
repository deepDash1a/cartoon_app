import 'package:cartoon_app/data/model/model.dart';
import 'package:cartoon_app/data/repository/repository.dart';
import 'package:cartoon_app/logic/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartoonAppCubit extends Cubit<CartoonAppStates> {
  CartoonAppCubit(this.characterRepository)
      : super(InitializeCartoonAppState());

  final CharacterRepository characterRepository;
  List<Character> characters = [];

  List<Character> getAllCharacters() {
    try {
      emit(LoadingCharactersCartoonAppState());
      characterRepository.getAllCharacters().then((characters) {
        this.characters = characters;
        emit(SuccessCharactersCartoonAppState(characters));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(ErrorCharactersCartoonAppState(e.toString()));
    }
    return characters;
  }
}
