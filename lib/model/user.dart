class User {
  static const String userIdKey = 'userId';
  static const String fullNameKey = 'fullName';
  static const String descriptionKey = 'description';
  static const String eMailKey = 'eMail';
  static const String phoneKey = 'phone';
  static const String profilePhotoKey = 'profilePhoto';
  static const String passwordKey = 'password';
  static const String notificationIdKey = 'notificationId';
  static const String imageUrlKey = 'imageUrl';
  static const String backgroundImageUrlKey = 'backgroundImageUrl';
  static const String specialImageUrlKey = 'specialImageUrls';

  String? userId;
  String fullName;
  String description;
  String eMail;
  String phone;
  String profilePhoto;
  String password;
  String notificationId;
  String imageUrl;
  String backgroundImageUrl;
  String specialImageUrl;

  User({
    required this.userId,
    required this.eMail,
    this.fullName = '',
    this.description = '',
    this.phone = '',
    this.profilePhoto = '',
    this.password = '',
    this.notificationId = '',
    this.imageUrl = '',
    this.backgroundImageUrl = '',
    this.specialImageUrl = '',
  });

  Map<String, dynamic> toMap() {
    return {
      userIdKey: userId,
      fullNameKey: fullName,
      descriptionKey: description,
      eMailKey: eMail,
      phoneKey: phone,
      profilePhoto: profilePhoto,
      passwordKey: password,
      notificationIdKey: notificationId,
    };
  }

  User.fromMap(this.userId, Map<String, dynamic> map)
      : fullName = map[fullNameKey] ?? '',
        description = map[descriptionKey] ?? '',
        eMail = map[eMailKey] ?? '',
        phone = map[phoneKey] ?? '',
        profilePhoto = map[profilePhotoKey] ?? '',
        password = map[passwordKey] ?? '',
        imageUrl = map[imageUrlKey] ?? '',
        backgroundImageUrl = map[backgroundImageUrlKey] ?? '',
        specialImageUrl = map[specialImageUrlKey] ?? '',
        notificationId = map[notificationIdKey] ?? '';
}
