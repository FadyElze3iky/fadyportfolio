import '../entities/tech_stack_item.dart';

abstract class TechStackRepository {
  Future<List<TechStackItem>> fetchTechStack();
}
