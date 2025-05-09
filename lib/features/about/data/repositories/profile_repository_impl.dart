import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Profile> getProfile() async {
    // TODO: Implement actual data fetching from Firebase
    return Profile(
      bio: '''
      I am a passionate Flutter developer with experience in building beautiful and functional applications. 
      My expertise includes:
      ''',
      skills: [
        'Mobile App Development',
        'Web Development',
        'UI/UX Design',
        'Clean Architecture',
        'State Management',
      ],
    );
  }
}
