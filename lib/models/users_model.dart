class UsersModel {
  String? name;
  String? role;
  String? email;
  String? cvURL;
  String? cvPath;
  String? cvName;
  String? avatarUrl;
  String? avatarName;
  String? about;

  UsersModel(
      {required this.name,
      required this.role,
      required this.email,
      required this.cvURL,
      required this.cvPath,
      required this.cvName,
      required this.avatarUrl,
      required this.avatarName,
      required this.about});
}
