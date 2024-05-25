import 'package:cartoon_app/core/colors.dart';
import 'package:cartoon_app/data/model/model.dart';
import 'package:cartoon_app/presentation/widgets/reusable_normal_text.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({
    super.key,
    required this.character,
  });

  final Character character;

  Widget buildCustomSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600.00,
      pinned: true,
      stretch: true,
      backgroundColor: AppColor.myBaseColor4,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: ReusableNormalText(
          text: character.name!,
          fontSize: 22.00,
          color: AppColor.myBaseColor1,
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 20.00,
              fontWeight: FontWeight.bold,
              color: AppColor.myBaseColor1,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 20.00,
              fontWeight: FontWeight.bold,
              color: AppColor.myBaseColor1,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: AppColor.myBaseColor4,
      height: 10.00,
      thickness: 4.00,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.myBaseColor3.withOpacity(0.5),
      body: CustomScrollView(
        slivers: [
          buildCustomSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                padding: const EdgeInsets.all(8.00),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    characterInfo(
                      'Name : ',
                      character.name!,
                    ),
                    buildDivider(325),
                    const SizedBox(
                      height: 10.00,
                    ),
                    characterInfo(
                      'Status : ',
                      character.status!,
                    ),
                    buildDivider(320),
                    const SizedBox(
                      height: 10.00,
                    ),
                    characterInfo(
                      'Species : ',
                      character.species!,
                    ),
                    buildDivider(310),
                    const SizedBox(
                      height: 10.00,
                    ),
                    characterInfo(
                      'Gender : ',
                      character.gender!,
                    ),
                    buildDivider(315),
                    const SizedBox(
                      height: 10.00,
                    ),
                    characterInfo(
                      'Origin name : ',
                      character.originName!,
                    ),
                    buildDivider(269),
                    const SizedBox(
                      height: 10.00,
                    ),
                    characterInfo(
                      'Location name : ',
                      character.locationName!,
                    ),
                    buildDivider(245),
                    const SizedBox(
                      height: 10.00,
                    ),
                    characterInfo(
                      'Created : ',
                      character.created!,
                    ),
                    buildDivider(308),
                    const SizedBox(
                      height: 10.00,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
