class ListUtil {
  static List<List<T>> chunk<T>(List<T> list, int length) {
    List<List<T>> chunks = [];
    for (var i = 0; i < list.length; i += 2) {
      chunks.add(list.sublist(i, i+2 > list.length ? list.length : i + 2));
    }
    return chunks;
  }
}