// service_page.dart
import 'package:flutter/material.dart';
import 'service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> services = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadServices();
  }

  Future<void> loadServices() async {
    try {
      final data = await APIService().fetchServices();
      setState(() {
        services = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading services: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(service['title']),
                    subtitle: Text('\$${service['price']}'),
                  ),
                );
              },
            ),
    );
  }
}
