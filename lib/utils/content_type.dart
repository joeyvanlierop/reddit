// https://github.com/ccrama/Slide/blob/master/app/src/main/java/me/ccrama/redditslide/ContentType.java

enum Type {
  none,
  image,
  gif,
  video,
}

class ContentType {
  static bool isImage(Uri uri) {
    try {
      final String host = uri.host.toLowerCase();
      final String path = uri.path.toLowerCase();

      return host.contains('i.reddituploads.com') ||
          path.endsWith('.png') ||
          path.endsWith('.jpg') ||
          path.endsWith('.jpeg');
    } catch (e) {
      return false;
    }
  }

  static bool isGif(Uri uri) {
    try {
      final String host = uri.host.toLowerCase();
      final String path = uri.path.toLowerCase();

      return host.contains('gfycat.com') ||
          host.contains('v.redd.it') ||
          path.endsWith('.gif') ||
          path.endsWith('.gifv') ||
          path.endsWith('.webm') ||
          path.endsWith('.mp4');
    } catch (e) {
      return false;
    }
  }

  /*static bool isAlbum(Uri uri) {
    try {
      final String host = uri.host.toLowerCase();
      final String path = uri.path.toLowerCase();

      return host.contains('imgur.com') ||
          host.contains('bildgur.de') &&
              (path.startsWith('/a/') ||
                  path.startsWith('/gallery/') ||
                  path.startsWith('/g/') ||
                  path.contains(','));
    } catch (e) {
      return false;
    }
  }*/

  /*static bool isImgurLink(Uri uri) {
    try {
      final String host = uri.host.toLowerCase();

      return (host.contains('imgur.com') || host.contains('bildgur.de')) &&
          !isAlbum(uri) &&
          !isGif(uri) &&
          !isImage(uri);
    } catch (e) {
      return false;
    }
  }*/

  static bool isVideo(Uri uri) {
    try {
      final String host = uri.host.toLowerCase();
      final String path = uri.path.toLowerCase();

      return (host.contains('youtu.be') ||
              host.contains('youtube.com') ||
              host.contains('youtube.co.uk')) &&
          !path.contains('/user/') &&
          !path.contains('/channel/');
    } catch (e) {
      return false;
    }
  }

  static Type getContentType(Uri uri) {
    try {
      if (isImage(uri)) {
        return Type.image;
      }
      if (isGif(uri)) {
        return Type.gif;
      }
      if (isVideo(uri)) {
        return Type.video;
      }
      return Type.none;
    } catch (e) {
      return Type.none;
    }
  }
}
