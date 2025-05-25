import 'package:cloud_firestore/cloud_firestore.dart';
import 'service_model.dart';

class HomeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ServiceModel>> fetchServices() async {
    try {
      print('fetchServices() called');
      final snapshot = await _firestore.collection('services').get();
      print('Documents fetched: ${snapshot.docs.length}');
      for (var doc in snapshot.docs) {
        print('Document data: ${doc.data()}');
      }
      
      return snapshot.docs
          .map((doc) => ServiceModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching services: $e');
      return [];
    }
  }
}
