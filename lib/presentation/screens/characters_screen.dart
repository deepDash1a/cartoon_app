import 'package:cartoon_app/core/colors.dart';
import 'package:cartoon_app/data/model/model.dart';
import 'package:cartoon_app/logic/cubit.dart';
import 'package:cartoon_app/logic/state.dart';
import 'package:cartoon_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // for get all characters
  List<Character> allCharacters = [];
  bool _isSearched = false;

  List<Character> searchForCharacters = [];
  static var searchedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // convert cubit from lazy state to action state.
    BlocProvider.of<CartoonAppCubit>(context).getAllCharacters();
  }

  // tree widgets for get all characters.
  Widget buildBlocWidget() {
    return BlocBuilder<CartoonAppCubit, CartoonAppStates>(
        builder: (context, state) {
          if (state is SuccessCharactersCartoonAppState) {
            allCharacters = state.allCharacters;
            return buildSuccessListItem();
          } else {
            return showLoadingIndicator();
          }
        });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.myBaseColor4,
      ),
    );
  }

  Widget buildSuccessListItem() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildSuccessCharactersList(),
        ],
      ),
    );
  }

  Widget buildSuccessCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 3,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchedController.text.isEmpty
          ? allCharacters.length
          : searchForCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: searchedController.text.isEmpty
              ? allCharacters[index]
              : searchForCharacters[index],
        );
      },
    );
  }

  Widget searchedFieldItem() {
    return TextField(
      controller: searchedController,
      cursorColor: AppColor.myBaseColor2,
      decoration: const InputDecoration(
        hintText: 'find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 16.00,
          fontWeight: FontWeight.w500,
          color: AppColor.myBaseColor1,
        ),
      ),
      style: const TextStyle(
        fontSize: 16.00,
        fontWeight: FontWeight.w500,
        color: AppColor.myBaseColor1,
      ),
      onChanged: (searchedCharacter) {
        addSearchedCharactersToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedCharactersToSearchedList(String searchedCharacter) {
    searchForCharacters = allCharacters
        .where((element) =>
        element.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (_isSearched) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: AppColor.myBaseColor3,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: AppColor.myBaseColor2,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearched = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchedController.clear();
    });
  }

  Widget getNormalAppBar() {
    return const Text(
      'Characters',
      style: TextStyle(
        color: AppColor.myBaseColor1,
        fontSize: 21.00,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.myBaseColor4,
        title: _isSearched ? searchedFieldItem() : getNormalAppBar(),
        actions: _buildAppBarAction(),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            vertical: 8.00, horizontal: 6.00),
        child: buildBlocWidget(),
      ),
    );
  }
}
