class AdsInitializer {
  AdsInitializer._();

  static final AdsInitializer instance = AdsInitializer._();

  Future<void> ensureInitialized() async {
    // Ads SDK is temporarily disabled for launch stability on iOS.
  }
}
