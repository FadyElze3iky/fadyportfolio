import '../entities/tech_stack_item.dart';
import '../repositories/tech_stack_repository.dart';

class FetchTechStack {
  final TechStackRepository repository;

  FetchTechStack(this.repository);

  Future<List<TechStackItem>> call() {
    return repository.fetchTechStack();
  }
}
