import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Profile> getProfile() async {
    // TODO: Implement actual data fetching from Firebase
    return Profile(
      whatIDo1: '''
      With a strong foundation in Flutter and Jetpack Compose, I bring a versatile and hands-on approach to cross-platform and native Android development, having built a variety of mobile and web applications from the ground up. As a Computer Science graduate, I combine technical expertise with a deep understanding of user-centric design, aiming to create seamless, efficient, and meaningful digital experiences.
One of my standout projects is Xfit, a Flutter-based app designed to help users monitor their daily diet and nutritional intake. The app goes beyond simple logging—it provides insightful analytics that empower users to make informed dietary choices and stay on track with their fitness goals.
In addition to that, I recently launched Brain Scope AI, an innovative application that harnesses the power of machine learning to analyze brain MRI images and accurately classify dementia levels. Built with a high-performance CNN model, the app achieves impressive accuracy while maintaining a clean and accessible interface, making advanced healthcare technology more approachable.
Another impactful project I worked on is Helping Hands, a comprehensive emergency response application aimed at improving real-time support and coordination during accidents or crises. 
      ''',
      whatIDo2: '''
     The app features accident detection, real-time alerts, a danger map with K-means clustering, and an AI-pow ered First Aid chatbot. It exemplifies my commitment to developing tech that serves a social purpose and enhances community safety.
I've also built a feature-rich e-commerce dashboard that supports inventory management, admin roles, live alerts, and sales analytics—all within a clean and intuitive UI.
My work reflects a balance of technical proficiency, creative problem-solving, and a strong focus on scalability and user experience. I’m passionate about building tools that not only function well but also positively impact people’s lives. Whether it's a health-focused mobile app, an emergency response system, or a business management solution, I’m always driven by the goal of delivering reliable, elegant, and meaningful solutions.
      ''',
      WhatIDid: '''
      Before diving into mobile and web development, I dedicated significant time to mastering app design and UI/UX principles—an experience that continues to shape the way I build software today. This early focus on design cultivated a keen eye for visual detail, a deep appreciation for intuitive user flows, and a strong ability to translate ideas into engaging, user-centered interfaces.
My background in UI/UX doesn't just influence how my applications look—it informs how they feel and function. I understand that a successful product is more than just code; it’s an experience that needs to resonate with users. This mindset has enabled me to create applications that are not only aesthetically pleasing, but also functional, accessible, and delightful to use.
As I transitioned into development, I found that my design skills complemented my technical abilities, allowing me to bridge the gap between design and engineering seamlessly. Projects like Xfit, which empowers users to track and analyze their diet progress, and Helping Hands, a real-time emergency response app with features like accident detection, alert notifications, danger mapping using K-means clustering, and a first aid AI chatbot, are great examples of how I’ve merged clean, intuitive UI with powerful functionality. In both apps, the interface plays a crucial role in simplifying complex tasks, making life-saving or health-focused features easy to use in real-world scenarios.
Another testament to this synergy is DashboardPlus, a full-featured e-commerce management tool. Despite its complexity—handling everything from inventory and sales tracking to admin management and real-time alerts—it maintains a minimalist design that makes navigation simple and efficient. Thanks to my design-first mindset, even feature-rich platforms can feel lightweight and approachable.
In addition to design and development, I’m also skilled at communicating with AI tools—leveraging them effectively to accelerate problem-solving, enhance creativity, and achieve optimal results. Whether it's refining UI components, optimizing logic, or generating content ideas, I know how to integrate AI into my workflow for maximum impact.
By combining the creative discipline of design, the technical precision of development, and the strategic use of AI tools, I’ve been able to build solutions that truly put the user first. This holistic approach ensures that every product I work on not only solves real problems but does so in a way that feels natural, engaging, and intuitive.
      ''',
    );
  }
}
