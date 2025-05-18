import '../../domain/entities/tech_stack_item.dart';

class TechStackItemModel extends TechStackItem {
  TechStackItemModel({
    required String icon,
    required String name,
    required String type,
    required String url,
  }) : super(
          icon: icon,
          name: name,
          type: type,
          url: url,
        );

  factory TechStackItemModel.fromMap(Map<String, dynamic> map) {
    return TechStackItemModel(
      icon: map['icon'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      url: map['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'name': name,
      'type': type,
      'url': url,
    };
  }

  factory TechStackItemModel.fromEntity(TechStackItem entity) {
    return TechStackItemModel(
      icon: entity.icon,
      name: entity.name,
      type: entity.type,
      url: entity.url,
    );
  }
}
