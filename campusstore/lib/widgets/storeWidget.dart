import 'package:campusstore/models/store.dart';
import 'package:campusstore/services/storeService.dart';
import 'package:flutter/material.dart';

class StoreWidget extends StatefulWidget {
  final int userId; 

  StoreWidget({Key? key, required this.userId}) : super(key: key);

  @override
  _StoreWidgetState createState() => _StoreWidgetState();
}

class _StoreWidgetState extends State<StoreWidget> {
  late Future<Store?> _storeFuture;
  final storeService = StoreService();

 @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  // Fetches the user data asynchronously.
  void _fetchUser() {
    setState(() {
      _storeFuture = storeService.fetchStoreByUserId(
          context, widget.userId); // Fetch updated user data.
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

}
