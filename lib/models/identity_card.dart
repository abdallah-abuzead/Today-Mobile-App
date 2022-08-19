class IdentityCard {
  int? id;
  String? imagePath;

  IdentityCard({required this.imagePath});

  IdentityCard.fromMap(Map<String, dynamic> identityCard) {
    id = identityCard['id'];
    imagePath = identityCard['image_path'];
  }

  Map<String, dynamic> toMap() => {'image_path': imagePath};
}
