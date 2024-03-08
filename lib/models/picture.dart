import 'dart:convert';

class Picture {
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture copyWith({
    String? large,
    String? medium,
    String? thumbnail,
  }) =>
      Picture(
        large: large ?? this.large,
        medium: medium ?? this.medium,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory Picture.fromRawJson(String str) => Picture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
