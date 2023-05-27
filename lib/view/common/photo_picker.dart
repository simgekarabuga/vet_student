import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_student/generated/l10n.dart';
import 'package:vet_student/tools/color_helper.dart';

class PhotoPicker {
  final ImageCropper _imageCropper = ImageCropper();

  final String takePhotoText;
  final String chooseFromGalleryText;
  final String cancelText;
  final double maxImageWidth;
  final double aspectRatio;
  final bool cropImage;
  final CropSettings? cropSettings;

  PhotoPicker({
    this.takePhotoText = '',
    this.chooseFromGalleryText = '',
    this.cancelText = '',
    this.maxImageWidth = 400.0,
    this.aspectRatio = 1.0,
    this.cropImage = false,
    this.cropSettings,
  });

  Future<File?> pick(BuildContext context) async {
    int? result = await showModalBottomSheet<int>(
      context: context,
      builder: (builder) => _buildBottomSheet(context),
    );

    if (result != null) {
      ImageSource? source;
      source = result == 0
          ? ImageSource.camera
          : result == 1
              ? ImageSource.gallery
              : null;

      return await _getImage(context, source);
    }
    return null;
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          child: Text(takePhotoText),
          onPressed: () => Navigator.pop(context, 0),
        ),
        TextButton(
          child: Text(chooseFromGalleryText),
          onPressed: () => Navigator.pop(context, 1),
        ),
        TextButton(
          child: Text(cancelText),
          onPressed: () => Navigator.pop(context, 2),
        ),
      ],
    );
  }

  CropSettings _defaultCropSettings(BuildContext context) => CropSettings(
        S.of(context).editPhoto,
        ColorHelper.primaryColor,
        ColorHelper.buttonTextColor,
        ColorHelper.buttonTextColor,
      );

  Future<File?> _getImage(BuildContext context, ImageSource? source) async {
    if (source != null) {
      ImagePicker imagePicker = ImagePicker();
      XFile? pickedFile = await imagePicker.pickImage(
        source: source,
        maxWidth: maxImageWidth,
      );

      if (pickedFile != null) {
        return cropImage
            ? await _cropImage(context, pickedFile.path)
            : File(pickedFile.path);
      }
    }
    return null;
  }

  Future<File?> _cropImage(BuildContext context, String filePath) async {
    CropSettings finalCropSettings =
        cropSettings ?? _defaultCropSettings(context);
    CroppedFile? croppedFile = await _imageCropper.cropImage(
      sourcePath: filePath,
      aspectRatio: CropAspectRatio(ratioX: aspectRatio, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: finalCropSettings.toolbarTitle,
          toolbarColor: finalCropSettings.toolbarColor,
          toolbarWidgetColor: finalCropSettings.toolbarWidgetColor,
          activeControlsWidgetColor:
              finalCropSettings.activeControlsWidgetColor,
        ),
        IOSUiSettings(
          title: finalCropSettings.toolbarTitle,
        ),
      ],
      //aspectRatioPresets: [
      //  CropAspectRatioPreset.original
      //  CropAspectRatioPreset.ratio16x9
      //  CropAspectRatioPreset.ratio4x3
      //]
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }
}

class CropSettings {
  final String? toolbarTitle;
  final Color? toolbarColor;
  final Color? toolbarWidgetColor;
  final Color? activeControlsWidgetColor;

  CropSettings(
    this.toolbarTitle,
    this.toolbarColor,
    this.toolbarWidgetColor,
    this.activeControlsWidgetColor,
  );
}
