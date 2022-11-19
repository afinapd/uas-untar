class Posts {
  final String id;
  final String profile_image;
  final String post;
  final String caption;
  final int comment;
  final String date;
  final bool likes_by;
  final int likes_count;
  final bool is_loved;
  final String username;

  Posts({
    required this.id,
    required this.profile_image,
    required this.post,
    required this.caption,
    required this.comment,
    required this.date,
    required this.likes_by,
    required this.likes_count,
    required this.is_loved,
    required this.username,
  });
}