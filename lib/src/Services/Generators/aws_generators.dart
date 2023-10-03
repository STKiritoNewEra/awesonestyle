class AwsGenerators {
  /// [year] returns a list of years
  /// [start] and [finish] can be used to set the start year and last year
  static List<int> year({int? start, int? finish}) {
    const int localStart = 1922;
    final int localFinish = DateTime.now().year;
    final y = localFinish - localStart;
    return List<int>.generate(y, (index) => localStart + (index + 1));
  }
}
