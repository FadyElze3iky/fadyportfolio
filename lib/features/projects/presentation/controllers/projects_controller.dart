import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fadyportfolio/features/projects/data/repositories/projects_repository_impl.dart';
import 'package:get/get.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/get_projects_usecase.dart';

class ProjectsController extends GetxController {
  final GetProjectsUseCase getProjectsUseCase =
      GetProjectsUseCase(ProjectsRepositoryImpl(FirebaseFirestore.instance));

  final RxList<Project> projects = <Project>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    isLoading.value = true;
    error.value = '';
    final result = await getProjectsUseCase();
    if (result.isLeft) {
      error.value = result.left!;
    } else {
      projects.assignAll(result.right!);
    }
    isLoading.value = false;
  }
}
