import 'sw_card.dart';

class SwStack {
  SwStack(this.side, this.cards, this.title);

  String side;
  List<SwCard> cards;
  String title;

  int get length => cards.length;
  operator [](int index) => cards[index];

  SwCard removeAt(int index) => cards.removeAt(index);
  insert(int index, SwCard card) => cards.insert(index, card);
  add(SwCard card) => cards.add(card);
  addAll(List<SwCard> cards) => cards.addAll(cards);

  SwStack.fromCardNames(
      String side, List<String> names, List<SwCard> cardLibrary, String title)
      : side = side,
        cards = names
            .map((name) {
              return cardLibrary.firstWhere(
                  (c) => (c.title == name && c.side == side), orElse: () {
                print("Could not find card when creating Stack");
                print(name);
                return null;
              });
            })
            .where((value) => value != null)
            .toList()
            .cast<SwCard>(),
        title = title;
}
