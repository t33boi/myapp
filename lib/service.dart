import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  List<dynamic> services = [];
  bool isLoading = true;

  // fectch data

  Future<dynamic> fetchServices() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
       
          isLoading = false;
         return json.decode(response.body);
      
      } else {
        throw Exception('Failed to load services');
      }
    } catch (e) {
      isLoading = false;
      print('Error fetching services: $e');
    }
  }
}
