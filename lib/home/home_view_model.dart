import 'package:flutter/material.dart';
import 'service_model.dart';
import 'home_service.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService _homeService = HomeService();
  List<ServiceModel> _services = [];
  bool _isLoading = true;

  List<ServiceModel> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    _services = await _homeService.fetchServices();
     // Sort by backgroundImage
    _services.sort((a, b) => a.backgroundImage.compareTo(b.backgroundImage));

    _isLoading = false;
    notifyListeners();
  }
}
