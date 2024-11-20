import 'dart:convert';
import 'package:budget_planner/home/storage/datamodels.dart';
import 'package:budget_planner/home/storage/sharedperferences.dart';

class FinancialDataManager {


  final SharedPreferencesService _storage = SharedPreferencesService();

  Future<void> saveFinancialData(String key, FinancialData data) async {
    try {

       print('Saving data with key: $key');
  print('Data: ${data.toJson()}');
      String jsonString = jsonEncode(data.toJson()); // Convert to JSON string
      await _storage.saveData(key, jsonString);
     
 print('Data successfully saved.');

    } catch (e) {
      throw Exception("Failed to save financial data: $e");
    }
  }

 
  Future<FinancialData?> readFinancialData(String key) async {
    try {
      String? jsonString = await _storage.readData(key);
      if (jsonString != null) {
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return FinancialData.fromJson(jsonMap);
      }
      return null; 
    } catch (e) {
      throw Exception("Failed to read financial data: $e");
    }
  }

 
 Future<List<FinancialData>> getAllFinancialData() async {
  try {
    List<String> keys = await _storage.getAllKeys();
    print('Retrieved keys: $keys');

    List<FinancialData> allData = [];
    for (String key in keys) {
      try {
        String? jsonString = await _storage.readData(key);
        print('Data for key $key: $jsonString');
        
        if (jsonString != null) {
          Map<String, dynamic> jsonMap = jsonDecode(jsonString);
          print('JSON Map for key $key: $jsonMap');
          
          allData.add(FinancialData.fromJson(jsonMap));
        }
      } catch (e) {
        print('Error processing key $key: $e');
      }
    }
    print('All data: $allData');
    return allData;
  } catch (e) {
    throw Exception("Failed to retrieve all financial data: $e");
  }
}


  Future<void> updateFinancialData(String key, FinancialData data) async {
    await saveFinancialData(key, data); // Overwrite the existing entry
  }

 
  Future<void> deleteFinancialData(String key) async {
    try {
      await _storage.deleteData(key);
    } catch (e) {
      throw Exception("Failed to delete financial data: $e");
    }
  }

  
  Future<void> clearAllFinancialData() async {
    try {
      await _storage.clearAllData();
    } catch (e) {
      throw Exception("Failed to clear all financial data: $e");
    }
  }


  Future<bool> hasFinancialData(String key) async {
    try {
      return await _storage.containsKey(key);
    } catch (e) {
      throw Exception("Failed to check for key existence: $e");
    }
  }
}
