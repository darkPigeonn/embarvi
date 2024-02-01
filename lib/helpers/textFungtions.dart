String justifyTextWithSpace(String text, int totalLength) {
  List<String> words = text.split(' ');
  String firstWord = words.first;
  String remainingText = words.skip(1).join(' ');

  // Menghitung jumlah spasi atau tab yang diperlukan
  int spacesToAdd = totalLength - text.length;

  // Menambahkan spasi atau tab pada kata pertama
  String justifiedText = '$firstWord${' ' * spacesToAdd}$remainingText';

  return justifiedText;
}
