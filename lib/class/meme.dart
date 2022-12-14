class Meme {
  int idmeme;
  String url;
  String text_atas;
  String text_bawah;
  int likes;
  int iduser;

  Meme({
    required this.idmeme,
    required this.url,
    required this.text_atas,
    required this.text_bawah,
    required this.likes,
    required this.iduser
  });
  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
        idmeme: json['idmeme'] as int,
        url: json['url'] as String,
        text_atas: json['text_atas'] as String,
        text_bawah: json['text_bawah'] as String,
        likes: json['likes'] as int,
        iduser: json['iduser'] as int
    );
  }
}