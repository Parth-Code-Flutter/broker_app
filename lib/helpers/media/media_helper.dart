// import 'package:mona_water/helpers/dev/dev_helper.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class MediaHelper {
//   static Future<PlatformFile?> pickFile({bool onlyPdf = false}) async {
//     final result = await FilePicker.platform.pickFiles(
//       withData: true,
//       type: FileType.custom,
//       allowedExtensions: onlyPdf
//           ? ['pdf']
//           : [
//               'jpg',
//               'pdf',
//               'png',
//               'jpeg',
//             ],
//     );

//     if (result == null) return null;

//     final file = result.files.first;

//     return file;
//   }

//   static Future<PlatformFile?> downloadFile(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode != 200) return null;

//       final bytes = response.bodyBytes;

//       final name = url.split('/').last;

//       return PlatformFile(
//         name: name,
//         size: bytes.length,
//         bytes: bytes,
//       );
//     } catch (e) {
//       DevHelper.log(e);
//       return null;
//     }
//   }

//   static Future<XFile?> pickImage({required bool isCamera}) async {
//     final imagePicker = ImagePicker();
//     final image = await imagePicker.pickImage(
//       source: isCamera ? ImageSource.camera : ImageSource.gallery,
//     );
//     return image;
//   }
// }
