class ImageDoc {}

extension ImagesPath on ImageDoc {
  static String getPath(String name) {
    return 'biocare-doc/assets/images/$name';
  }
}
