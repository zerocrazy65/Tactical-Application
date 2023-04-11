
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final querySnapshot = await _firestore
          .collection('TestData')
          .orderBy('age', descending: true)
          .get();
      final List<DocumentSnapshot> documents = querySnapshot.docs;
      return documents
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
