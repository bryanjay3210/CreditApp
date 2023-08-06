import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  Future<XFile?> pickImage(
      {ImageSource source = ImageSource.gallery,
      int imageQuality = 100}) async {
    return await ImagePicker()
        .pickImage(source: source, imageQuality: imageQuality);
  }

  Future<CroppedFile?> cropImage(
          {required XFile file,
          CropStyle cropStyle = CropStyle.circle}) async =>
      await ImageCropper()
          .cropImage(sourcePath: file.path, cropStyle: cropStyle);
}
