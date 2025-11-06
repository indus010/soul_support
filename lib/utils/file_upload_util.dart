import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FileUploadUtil {
  static Future<Map<String, dynamic>?> pickAndUploadFile({
    bool allowMultiple = false,
    List<String>? allowedExtensions,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple,
        type: allowedExtensions != null ? FileType.custom : FileType.any,
        allowedExtensions: allowedExtensions,
      );

      if (result != null) {
        if (allowMultiple) {
          // Handle multiple files
          List<File> files = result.paths.map((path) => File(path!)).toList();
          return await _uploadFiles(files);
        } else {
          // Handle single file
          File file = File(result.files.single.path!);
          return await _uploadSingleFile(file);
        }
      }
      return null;
    } catch (e) {
      print('Error picking file: $e');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> pickAndUploadImage({
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (image != null) {
        File file = File(image.path);
        return await _uploadSingleFile(file);
      }
      return null;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  static Future<Map<String, dynamic>> _uploadSingleFile(File file) async {
    // TODO: Replace with your actual API endpoint
    String uploadUrl = 'YOUR_API_ENDPOINT';

    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

      // Add file to request
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: file.path.split('/').last,
        ),
      );

      // Send request
      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'File uploaded successfully',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': 'Failed to upload file',
          'error': responseData,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error uploading file',
        'error': e.toString(),
      };
    }
  }

  static Future<Map<String, dynamic>> _uploadFiles(List<File> files) async {
    // TODO: Replace with your actual API endpoint
    String uploadUrl = 'YOUR_API_ENDPOINT';

    try {
      // Create multipart request
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

      // Add all files to request
      for (var file in files) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'files[]',
            file.path,
            filename: file.path.split('/').last,
          ),
        );
      }

      // Send request
      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Files uploaded successfully',
          'data': responseData,
        };
      } else {
        return {
          'success': false,
          'message': 'Failed to upload files',
          'error': responseData,
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error uploading files',
        'error': e.toString(),
      };
    }
  }
}
