enum Flavor {
  PROD,
  DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Three Doors Prod';
      case Flavor.DEV:
        return 'Three Doors Dev';
      default:
        return 'Three Doors';
    }
  }

}
