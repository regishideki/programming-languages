(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same string), then you avoid several of the 
  functions in problem 1 having polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
  s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option(word, list) =
  let
    fun aux(list) =
      case list of 
          [] => []
        | x::xs => if same_string(x, word) then aux(xs) else x::aux(xs)
    val result = aux(list)
    val word_was_found = result <> list
  in
    if word_was_found then SOME(result) else NONE 
  end

fun get_substitutions1(list_of_lists, word) =
  case list_of_lists of
      [] => []
    | x::xs => 
      case all_except_option(word, x) of 
          NONE => get_substitutions1(xs, word)
        | SOME(list) => list @ get_substitutions1(xs, word)

fun get_substitutions2(list_of_lists, word) =
  let
    fun aux(list_of_lists, word, acc) = 
      case list_of_lists of
          [] => acc
        | x::xs => 
          case all_except_option(word, x) of 
              NONE => aux(xs, word, acc)
            | SOME(list) => aux(xs, word, acc @ list)
  in
    aux(list_of_lists, word, [])
  end

fun similar_names(list_of_lists, {first, middle, last}) =
  let
    val names = get_substitutions2(list_of_lists, first)
    fun full_names(names, acc) =
      case names of
          [] => acc
        | x::xs => full_names(xs, acc @ [{first=x, middle=middle, last=last}])
  in
    full_names(names, [{first=first, middle=middle, last=last}])
  end

(* you may assume that Num is always used with values 2, 3, ..., 10 though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove
(* put your solutions for problem 2 here *)

fun card_color(suit, _) =
  case suit of
      (Spades | Clubs) => Black
    | (Diamonds | Hearts) => Red

fun card_value(_, rank) =
  case rank of
      Num(value) => value
    | Ace => 11
    | (Jack | Queen | King) => 10

fun remove_card(deck, card_to_be_removed, ex) =
  let
    fun remove_card_from_deck(deck, already_removed) =
      case deck of
          [] => []
        | x::xs => if x = card_to_be_removed andalso not already_removed
                   then remove_card_from_deck(xs, true)
                   else x::remove_card_from_deck(xs, already_removed)
    val deck_with_card_removed = remove_card_from_deck(deck, false)
    val card_was_removed = deck_with_card_removed <> deck
  in
    if card_was_removed then deck_with_card_removed else raise ex
  end

fun all_same_color(deck) =
  case deck of
      [] => true
    | x::[] => true
    | x1::x2::xs => card_color(x1) = card_color(x2) andalso all_same_color(x2::xs)

fun sum_cards(cards) =
  let
    fun sum_cards_tail(cards, acc) =
      case cards of
          [] => acc
        | x::xs => sum_cards_tail(xs, acc + card_value(x))
  in
    sum_cards_tail(cards, 0)
  end

fun score(cards, goal) =
  goal - sum_cards(cards)