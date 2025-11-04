import 'package:flutter/material.dart';
import '../utils/file_upload_util.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadButton extends StatelessWidget {
  final String label;
  final List<String>? allowedExtensions;
  final bool allowMultiple;
  final bool imageOnly;
  final Function(Map<String, dynamic>?) onUploadComplete;

  const FileUploadButton({
    super.key,
    this.label = 'Upload File',
    this.allowedExtensions,
    this.allowMultiple = false,
    this.imageOnly = false,
    required this.onUploadComplete,
  });

  void _handleUpload(BuildContext context) async {
    if (imageOnly) {
      // Show image source picker
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () async {
                    Navigator.pop(context);
                    final result = await FileUploadUtil.pickAndUploadImage(
                      source: ImageSource.gallery,
                    );
                    onUploadComplete(result);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    final result = await FileUploadUtil.pickAndUploadImage(
                      source: ImageSource.camera,
                    );
                    onUploadComplete(result);
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Direct file picker
      final result = await FileUploadUtil.pickAndUploadFile(
        allowMultiple: allowMultiple,
        allowedExtensions: allowedExtensions,
      );
      onUploadComplete(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handleUpload(context),
      icon: Icon(imageOnly ? Icons.add_a_photo : Icons.upload_file),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
