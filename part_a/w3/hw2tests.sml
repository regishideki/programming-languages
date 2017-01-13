(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "./hw2.sml";

(*
You will write 11 SML functions (not counting local helper functions), 4 related to “name substitutions”
and 7 related to a made-up solitaire card game.
Your solutions must use pattern-matching. You may not use the functions null, hd, tl, isSome, or valOf,
nor may you use anything containing a # character or features not used in class (such as mutation). Note
that list order does not matter unless specifically stated in the problem.
Download hw2provided.sml from the course website. The provided code defines several types for you. You
will not need to add any additional datatype bindings or type synonyms.
The sample solution, not including challenge problems, is roughly 130 lines, including the provided code.
Do not miss the “Important Caveat” and “Assessment” after the “Type Summary.”
*)

(*
1. This problem involves using first-name substitutions to come up with alternate names. For example,
Fredrick William Smith could also be Fred William Smith or Freddie William Smith. Only part (d) is
specifically about this, but the other problems are helpful.
*)

(*
(a) Write a function all_except_option, which takes a string and a string list. Return NONE if the
string is not in the list, else return SOME lst where lst is identical to the argument list except the string
is not in it. You may assume the string is in the list at most once. Use same_string, provided to you,
to compare strings. Sample solution is around 8 lines.
*)
val test1 = all_except_option("string", ["string"]) = SOME []
val when_string_is_not_found = all_except_option("banana", ["apple"]) = NONE
val when_string_is_the_middle = all_except_option("banana", ["apple", "banana", "melon"]) = SOME ["apple", "melon"]

(*
(b) Write a function get_substitutions1, which takes a string list list (a list of list of strings, the
substitutions) and a string s and returns a string list. The result has all the strings that are in
some list in substitutions that also has s, but s itself should not be in the result. Example:
  get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred")
  answer: ["Fredrick","Freddie","F"]
Assume each list in substitutions has no repeats. The result will have repeats if s and another string are
both in more than one list in substitutions. Example:
  get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff")
  answer: ["Jeffrey","Geoff","Jeffrey"]
Use part (a) and ML’s list-append (@) but no other helper functions. Sample solution is around 6 lines.
*)
val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val when_inside_lists_has_more_elements = 
  get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = 
  ["Fredrick","Freddie","F"]
(*
(c) Write a function get_substitutions2, which is like get_substitutions1 except it uses a tail-recursive
local helper function.
*)
val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val when_inside_lists_has_more_elements_and_use_tail_recursion = 
  get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred") = 
  ["Fredrick","Freddie","F"]
(*
(d) Write a function similar_names, which takes a string list list of substitutions (as in parts (b) and
(c)) and a full name of type {first:string,middle:string,last:string} and returns a list of full
names (type {first:string,middle:string,last:string} list). The result is all the full names you
can produce by substituting for the first name (and only the first name) using substitutions and parts (b)
or (c). The answer should begin with the original name (then have 0 or more other names). Example:
similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"})
  answer: [{first="Fred", last="Smith", middle="W"},
  {first="Fredrick", last="Smith", middle="W"},
  {first="Freddie", last="Smith", middle="W"},
  {first="F", last="Smith", middle="W"}]
Do not eliminate duplicates from the answer. Hint: Use a local helper function. Sample solution is
around 10 lines.
val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
        [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
         {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]


2. You will write 11 SML functions (not counting local helper functions), 4 related to “name substitutions”
and 7 related to a made-up solitaire card game.
Your solutions must use pattern-matching. You may not use the functions null, hd, tl, isSome, or valOf,
nor may you use anything containing a # character or features not used in class (such as mutation). Note
that list order does not matter unless specifically stated in the problem.
Download hw2provided.sml from the course website. The provided code defines several types for you. You
will not need to add any additional datatype bindings or type synonyms.
The sample solution, not including challenge problems, is roughly 130 lines, including the provided code.
Do not miss the “Important Caveat” and “Assessment” after the “Type Summary.”
1. This problem involves using first-name substitutions to come up with alternate names. For example,
Fredrick William Smith could also be Fred William Smith or Freddie William Smith. Only part (d) is
specifically about this, but the other problems are helpful.

(a) Write a function all_except_option, which takes a string and a string list. Return NONE if the
string is not in the list, else return SOME lst where lst is identical to the argument list except the string
is not in it. You may assume the string is in the list at most once. Use same_string, provided to you,
to compare strings. Sample solution is around 8 lines.
val test5 = card_color (Clubs, Num 2) = Black

(b) Write a function get_substitutions1, which takes a string list list (a list of list of strings, the
substitutions) and a string s and returns a string list. The result has all the strings that are in
some list in substitutions that also has s, but s itself should not be in the result. Example:
  get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred")
  answer: ["Fredrick","Freddie","F"]
Assume each list in substitutions has no repeats. The result will have repeats if s and another string are
both in more than one list in substitutions. Example:
  get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff")
  answer: ["Jeffrey","Geoff","Jeffrey"]
Use part (a) and ML’s list-append (@) but no other helper functions. Sample solution is around 6 lines.
val test6 = card_value (Clubs, Num 2) = 2

(c) Write a function remove_card, which takes a list of cards cs, a card c, and an exception e. It returns a
list that has all the elements of cs except c. If c is in the list more than once, remove only the first one.
If c is not in the list, raise the exception e. You can compare cards with =.
val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

(d) Write a function all_same_color, which takes a list of cards and returns true if all the cards in the
list are the same color. Hint: An elegant solution is very similar to one of the functions using nested
pattern-matching in the lectures.
val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true

(e) Write a function sum_cards, which takes a list of cards and returns the sum of their values. Use a locally
defined helper function that is tail recursive. (Take “calls use a constant amount of stack space” as a
requirement for this problem.)
val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

(f) Write a function score, which takes a card list (the held-cards) and an int (the goal) and computes
the score as described above.
val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

(g) Write a function officiate, which “runs a game.” It takes a card list (the card-list) a move list
(what the player “does” at each point), and an int (the goal) and returns the score at the end of the
game after processing (some or all of) the moves in the move list in order. Use a locally defined recursive
helper function that takes several arguments that together represent the current state of the game. As
described above:
• The game starts with the held-cards being the empty list.
• The game ends if there are no more moves. (The player chose to stop since the move list is empty.)
• If the player discards some card c, play continues (i.e., make a recursive call) with the held-cards
not having c and the card-list unchanged. If c is not in the held-cards, raise the IllegalMove
exception.
• If the player draws and the card-list is (already) empty, the game is over. Else if drawing causes
the sum of the held-cards to exceed the goal, the game is over (after drawing). Else play continues
with a larger held-cards and a smaller card-list.
Sample solution for (g) is under 20 lines.
val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)
*)