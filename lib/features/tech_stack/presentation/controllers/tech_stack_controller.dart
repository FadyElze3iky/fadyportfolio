import 'package:get/get.dart';
import '../../domain/entities/tech_stack_item.dart';
import '../../domain/usecases/fetch_tech_stack.dart';

class TechStackController extends GetxController {
  final FetchTechStack fetchTechStack;

  TechStackController(this.fetchTechStack);

  var techStack = <TechStackItem>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadTechStack();
  }

  Future<void> loadTechStack() async {
    isLoading.value = true;
    error.value = '';
    try {
      techStack.value = await fetchTechStack();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
