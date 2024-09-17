const _assetsBasePath = 'assets/';

sealed class Assets {
  static final images = _Images();
}

final class _Images {
  static const _imagesBasePath = '${_assetsBasePath}images/';
  final String logo = '${_imagesBasePath}logo.png';
  final String google = '${_imagesBasePath}google.png';
  final String facebook = '${_imagesBasePath}facebook.png';
}
