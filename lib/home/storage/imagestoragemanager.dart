import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageStorageManager {
  static const String _imageKeyPrefix = "image_";

  /// Save an image to the local file system and store its path in SharedPreferences.
  Future<void> saveImage(String key, File imageFile) async {
    try {
      // Get the app's local directory.
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$key.png';

      // Copy the image to the file system.
      await imageFile.copy(filePath);

      // Store the file path in SharedPreferences.
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('$_imageKeyPrefix$key', filePath);

      print('Image saved: $filePath');
    } catch (e) {
      throw Exception("Failed to save image: $e");
    }
  }

  /// Retrieve an image file using its key.
  Future<File?> getImage(String key) async {
    try {
      // Retrieve the file path from SharedPreferences.
      final prefs = await SharedPreferences.getInstance();
      final filePath = prefs.getString('$_imageKeyPrefix$key');

      if (filePath != null) {
        final file = File(filePath);

        // Check if the file exists before returning.
        if (await file.exists()) {
          return file;
        } else {
          print("File not found at path: $filePath");
        }
      }

      return null;
    } catch (e) {
      throw Exception("Failed to retrieve image: $e");
    }
  }

  /// Delete an image from the file system and remove its metadata from SharedPreferences.
  Future<void> deleteImage(String key) async {
    try {
      // Retrieve the file path from SharedPreferences.
      final prefs = await SharedPreferences.getInstance();
      final filePath = prefs.getString('$_imageKeyPrefix$key');

      if (filePath != null) {
        final file = File(filePath);

        // Delete the file if it exists.
        if (await file.exists()) {
          await file.delete();
          print("Deleted image file: $filePath");
        }
      }

      // Remove the file path from SharedPreferences.
      prefs.remove('$_imageKeyPrefix$key');
    } catch (e) {
      throw Exception("Failed to delete image: $e");
    }
  }

  /// Check if an image exists for a given key.
  Future<bool> hasImage(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey('$_imageKeyPrefix$key');
    } catch (e) {
      throw Exception("Failed to check for image existence: $e");
    }
  }

  /// Clear all stored images and their metadata.
  Future<void> clearAllImages() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Get all keys and remove the ones related to images.
      final keys = prefs.getKeys().where((key) => key.startsWith(_imageKeyPrefix));
      for (String key in keys) {
        final filePath = prefs.getString(key);
        if (filePath != null) {
          final file = File(filePath);

          // Delete the file if it exists.
          if (await file.exists()) {
            await file.delete();
          }
        }

        // Remove the metadata from SharedPreferences.
        prefs.remove(key);
      }

      print("Cleared all images.");
    } catch (e) {
      throw Exception("Failed to clear all images: $e");
    }
  }
}
