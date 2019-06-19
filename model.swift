enum Suit: String {
    case clubs = "c"
    case diamonds = "d"
    case hearts = "h"
    case spades = "s"
}

enum Rank: Int {

    case ace = 1
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king

}

struct Card {
    var suit : Suit
    var rank : Rank


    func equals(_ otherCard: Card) -> Bool{
        return (self.rank == otherCard.rank) && (self.suit == otherCard.suit)
    }

    func description() -> String {
        var rankDescription : String
        switch self.rank.rawValue {
        case 1:
            rankDescription = "A"
        case 11:
            rankDescription = "J"
        case 12:
            rankDescription = "Q"
        case 13:
            rankDescription = "K"
        default:
            rankDescription = "\(self.rank.rawValue)"
        }
        return rankDescription + self.suit.rawValue
    }
}
    class CardSet {
        var cards : [Card] = []


        func description() -> String {

            var stringDescription: String = ""
            for card in cards {
                stringDescription += card.description() + ","
            }
            return String(stringDescription.dropLast())
        }
    }

class Hand: CardSet {

    func addCard(card: Card) {
        if cards.count <= 2 {
            cards.append(card)
        }
    }


}

class Board: CardSet {
    func addCard(card: Card) {
        if cards.count <= 5 {
            cards.append(card)
        }
    }
}


let aceSpades = Card(suit: .spades, rank: .ace)
let threeHeart = Card(suit: .hearts, rank: .three)
let twoDiamonds = Card(suit: .diamonds, rank: .two)

print(aceSpades.description())

var hand = Hand()
hand.addCard(card: aceSpades)
hand.addCard(card: threeHeart)
hand.addCard(card: twoDiamonds)
print(hand.description())

