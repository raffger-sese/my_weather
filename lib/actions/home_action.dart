class ShowLocation {
  final bool isShown;
  ShowLocation({this.isShown});
}

class RetrieveLocation {}

class LoadUserLocation {
  final double longitude;
  final double latitude;
  LoadUserLocation({this.longitude, this.latitude});
}
