import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/tech_stack_item_model.dart';
import '../../domain/entities/tech_stack_item.dart';
import '../../domain/repositories/tech_stack_repository.dart';

class TechStackRepositoryImpl implements TechStackRepository {
  final FirebaseFirestore firestore;

  TechStackRepositoryImpl(this.firestore);

  @override
  Future<List<TechStackItem>> fetchTechStack() async {
    final snapshot = await firestore.collection('tech_stack').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return TechStackItemModel.fromMap(data);
    }).toList();
  }
}
