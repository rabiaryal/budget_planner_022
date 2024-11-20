import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Singleton instance
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  // Save data (Create or Update)
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported data type');
    }
  }

  // Read data
  Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key); // Returns null if the key does not exist
  }

  // Delete a specific key
  Future<void> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // Clear all stored data
  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Check if a key exists
  Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  // Update data (Same as saveData since SharedPreferences automatically updates existing keys)
  Future<void> updateData(String key, dynamic value) async {
    await saveData(key, value);
  }

  // Retrieve all keys
  Future<List<String>> getAllKeys() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys().toList(); // Converts the Set of keys to a List
  }

  // Retrieve all key-value pairs
  Future<Map<String, dynamic>> getAllData() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final Map<String, dynamic> allData = {};
    for (String key in keys) {
      allData[key] = prefs.get(key); // Retrieve value for each key
    }
    return allData;
  }

  // Print all stored data for debugging
  Future<void> printAllData() async {
    final data = await getAllData();
    data.forEach((key, value) {
      print('Key: $key, Value: $value');
    });
  }
}
