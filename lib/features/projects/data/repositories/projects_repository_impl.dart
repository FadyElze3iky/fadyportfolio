import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import '../models/project_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final FirebaseFirestore firestore;
  ProjectsRepositoryImpl(this.firestore);

  @override
  Future<Either<String, List<Project>>> getProjects() async {
    try {
      final snapshot = await firestore.collection('projects').get();
      final projects =
          snapshot.docs.map((doc) => ProjectModel.fromMap(doc.data())).toList();
      return Either.right(projects);
    } catch (e) {
      return Either.left(e.toString());
    }
  }
}
