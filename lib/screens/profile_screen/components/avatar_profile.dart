import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/theme/my_theme.dart';

class AvatarProfile extends StatelessWidget {
  final double dimension;
  final String avatarUrl;
  final void Function(String filePath) onChangeImage;
  AvatarProfile(
      {super.key,
      required this.dimension,
      required this.avatarUrl,
      required this.onChangeImage});

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    XFile? galleryFile = await picker.pickImage(source: ImageSource.gallery);
    if (galleryFile == null) return;
    onChangeImage.call(galleryFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.square(
          dimension: dimension,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                border:
                    Border.all(width: 4, color: MyTheme.colors.secondaryColor),
                shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10000),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: avatarUrl,
                errorWidget: (context, url, error) {
                  return SvgPicture.asset("assets/my_custom_icons/avatar.svg");
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: 30,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: MyTheme.colors.secondaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 4),
                    color: Colors.black.withOpacity(
                      0.3,
                    ),
                    blurRadius: 3,
                  ),
                ]),
            child: IconButton(
              iconSize: 14,
              icon: const Icon(Icons.add_a_photo),
              color: MyTheme.colors.onSecondaryColor,
              onPressed: _pickImage,
            ),
          ),
        ),
      ],
    );
  }
}
