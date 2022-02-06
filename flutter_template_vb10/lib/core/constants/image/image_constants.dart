class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants? get instance => _instance ?? ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('gokhan');

  String toPng(String name) => 'asset/images/$name.png';
}
