import '../repositories/home_repository.dart';

class InitializeApp {
  final HomeRepository repository;

  InitializeApp(this.repository);

  Future<void> call() async {
    await repository.initializeApp();
  }
}
