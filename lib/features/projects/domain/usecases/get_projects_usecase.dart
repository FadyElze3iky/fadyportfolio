import '../repositories/projects_repository.dart';
import '../entities/project.dart';

class GetProjectsUseCase {
  final ProjectsRepository repository;
  GetProjectsUseCase(this.repository);

  Future<Either<String, List<Project>>> call() async {
    return await repository.getProjects();
  }
}
