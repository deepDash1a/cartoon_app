import 'package:cartoon_app/core/colors.dart';
import 'package:cartoon_app/core/images.dart';
import 'package:cartoon_app/core/strings.dart';
import 'package:cartoon_app/data/model/model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            charactersDetailsScreenRoute,
            arguments: character,
          );
          debugPrint(character!.name);
        },
        child: Hero(
          tag: character!.id!,
          child: Card(
            color: AppColor.myBaseColor1,
            child: Column(
              children: [
                character!.image!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: 250,
                        placeholder: AppImages.placeholderCharacterImageGIF,
                        fit: BoxFit.cover,
                        image: character!.image!,
                      )
                    : const Image(
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AppImages.placeholderCharacterImage,
                        ),
                      ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 8.00),
                    decoration: BoxDecoration(
                      color: AppColor.myBaseColor4,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.myBaseColor4.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      '${character!.name}',
                      style: const TextStyle(
                        height: 1.3,
                        fontSize: 17.00,
                        fontWeight: FontWeight.bold,
                        color: AppColor.myBaseColor1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
