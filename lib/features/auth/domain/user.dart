class User {
  const User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.role,
  });

  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String role;
}
