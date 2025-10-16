import 'package:flutter/material.dart';
import 'package:push_note/const/images.dart';
import 'package:push_note/const/strings.dart';
import 'package:push_note/presentation/components/settings/title_for_cluster.dart';
import 'package:push_note/presentation/components/settings/universal_cluster.dart';

class BackgroundCluster extends StatelessWidget {
  const BackgroundCluster({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleForCluster(icon: AppIcons.background, title: AppStrings.background),
        UniversalCluster(_BackgroundsList())
      ],
    );
  }
}

class _BackgroundsList extends StatelessWidget {
  const _BackgroundsList();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width / 8;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _OneItem(
          AppImages.background1,
          isActive: true,
          width: width,
        ),
        _OneItem(
          AppImages.background2,
          isActive: false,
          width: width,
        ),
        _OneItem(
          AppImages.background3,
          isActive: false,
          width: width,
        )
      ],
    );
  }
}

class _OneItem extends StatelessWidget {
  final String image;
  final bool isActive;
  final double width;
  const _OneItem(
    this.image, {
    required this.isActive,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print('ff');
        },
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_OneImage(image), const SizedBox(height: 12), FlutterLogo()],
          ),
        ),
      ),
    );
  }
}

class _OneImage extends StatelessWidget {
  final String image;
  const _OneImage(
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: double.infinity,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
