import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';

class ProfilePicture extends StatelessWidget {
  final String? path;
  final bool? isFile, isNework, isAsset;
  final double? size;
  final String? text;

  const ProfilePicture.network(
      {super.key,
      this.size = 50,
      required this.path,
      this.text,
      this.isFile = false,
      this.isNework = false,
      this.isAsset = false});

  const ProfilePicture.asset(
      {super.key,
      this.size = 150,
      required this.path,
      this.text,
      this.isFile = false,
      this.isNework = false,
      this.isAsset = true});

  const ProfilePicture.file(
      {super.key,
      this.size = 150,
      this.text,
      required this.path,
      this.isFile = true,
      this.isNework = false,
      this.isAsset = false});

  const ProfilePicture.text({
    super.key,
    this.size = 150,
    this.path,
    required this.text,
    this.isFile = false,
    this.isNework = false,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Container(
        padding: const EdgeInsets.all(10),
        width: size!.h,
        height: size!.h,
        decoration: const BoxDecoration(
          color: ColorPalette.borderColorLight,
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Center(
            child: Text(
              text!,
              style: const TextStyle(
                color: ColorPalette.primary,
              ),
            ),
          ),
        ),
      );
    }

    if (path?.isEmpty ?? false) {
      return Container(
        width: size!.h,
        height: size!.h,
        decoration: const BoxDecoration(
          color: ColorPalette.lightGrey,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.person,
          color: ColorPalette.white,
        ),
      );
    }
    if (isAsset!) {
      return _buildAsset(path!);
    }
    if (isFile!) {
      return _buildFile(path!);
    }
    return _buildNetworkImage(path!);
  }

  Widget _buildFile(String path) {
    return Container(
      width: size!.h,
      height: size!.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.file(File(path), fit: BoxFit.cover)),
    );
  }

  Widget _buildAsset(String path) {
    return Container(
      width: size!.h,
      height: size!.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  Widget _buildNetworkImage(String path) {
    return CachedNetworkImage(
      imageUrl: path,
      imageBuilder: (context, imageProvider) => Container(
        width: size!.h,
        height: size!.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => ShimmerContainer(
        height: size!.h,
        width: size!.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
