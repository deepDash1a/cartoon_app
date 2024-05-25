import 'package:cartoon_app/data/model/model.dart';

abstract class CartoonAppStates {}

class InitializeCartoonAppState extends CartoonAppStates {}

class LoadingCharactersCartoonAppState extends CartoonAppStates {}

class SuccessCharactersCartoonAppState extends CartoonAppStates {
  final List<Character> allCharacters;

  SuccessCharactersCartoonAppState(this.allCharacters);
}

class ErrorCharactersCartoonAppState extends CartoonAppStates {
  final String error;

  ErrorCharactersCartoonAppState(this.error);
}
