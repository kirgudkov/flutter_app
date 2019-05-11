class Movie {
  String artistName;
  String artworkUrl30;
  String artworkUrl60;
  String artworkUrl100;
  double collectionHdPrice;
  double collectionPrice;
  String kind;
  String previewUrl;
  String trackCensoredName;
  double trackHdPrice;
  double trackHdRentalPrice;
  int trackId;
  String trackName;
  double trackPrice;
  double trackRentalPrice;
  String trackViewUrl;
  String wrapperType;

  Movie({
    this.artistName,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionHdPrice,
    this.collectionPrice,
    this.kind,
    this.previewUrl,
    this.trackCensoredName,
    this.trackHdPrice,
    this.trackHdRentalPrice,
    this.trackId,
    this.trackName,
    this.trackPrice,
    this.trackRentalPrice,
    this.trackViewUrl,
    this.wrapperType});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      artistName: json['artistName'],
      artworkUrl30: json['artworkUrl30'],
      artworkUrl60: json['artworkUrl60'],
      artworkUrl100: json['artworkUrl100'],
      collectionHdPrice: json['collectionHdPrice'],
      collectionPrice: json['collectionPrice'],
      kind: json['kind'],
      previewUrl: json['previewUrl'],
      trackCensoredName: json['trackCensoredName'],
      trackHdPrice: json['trackHdPrice'],
      trackHdRentalPrice: json['trackHdRentalPrice'],
      trackId: json['trackId'],
      trackName: json['trackName'],
      trackPrice: json['trackPrice'],
      trackRentalPrice: json['trackRentalPrice'],
      trackViewUrl: json['trackViewUrl'],
      wrapperType: json['wrapperType'],
    );
  }
}
