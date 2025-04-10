import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'my_avatar_placeholder.dart';

class MyAvatar extends StatelessWidget {
  final String? url;
  final double size;
  final Color color;
  final File? file;
  final Color? borderColor;
  final Widget? placeholder;
  const MyAvatar({
    this.url,
    super.key,
    this.size = 40,
    this.color = Colors.white,
    this.file,
    this.borderColor,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: file != null
              ? Image.file(
                  file!,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  cacheKey: url,
                  width: size,
                  height: size,
                  imageUrl: url ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return placeholder ??
                        MyAvatarPlaceholder(
                          size: size,
                          color: color,
                        );
                  },
                  errorWidget: (context, url, error) {
                    return placeholder ??
                        MyAvatarPlaceholder(
                          size: size,
                          color: color,
                        );
                  },
                ),
        ),
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: borderColor ?? color.withAlpha(120),
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        ),
      ],
    );
  }
}
