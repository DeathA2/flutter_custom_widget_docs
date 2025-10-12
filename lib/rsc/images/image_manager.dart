class ImagesApp {
  ///////////
  //       //
  //  PNG  //
  //       //
  ///////////

  ///////////
  //       //
  //  SVG  //
  //       //
  ///////////
  static String icCopy = ImagesPath.getPath('ic_copy.svg');
  static String icSnackbarSuccess = ImagesPath.getPath(
    'ic_snackbar_success.svg',
  );

  // Logo
  static String logoGithub = ImagesPath.getPath('github_logo.svg');

  ////////////
  //        //
  //  JSON  //
  //        //
  ////////////

  ///////////
  //       //
  //  JPG  //
  //       //
  ///////////
}

extension ImagesPath on ImagesApp {
  static String getPath(String name) {
    if (name.contains('.svg')) {
      return 'assets/svg/$name';
    }
    if (name.contains('.png')) {
      return 'assets/png/$name';
    }
    if (name.contains('.jpg')) {
      return 'assets/jpg/$name';
    }
    if (name.contains('.json')) {
      return 'assets/json/$name';
    }
    return 'assets/svg/$name';
  }
}
