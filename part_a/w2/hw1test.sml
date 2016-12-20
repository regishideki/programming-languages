(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your
   code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test1 = is_older ((1,2,3),(2,3,4)) = true
val year_of_first_is_greater = is_older((2000,1,1), (1999,2,2)) = false
val year_of_second_is_greater = is_older((2000,2,2), (2001,1,1)) = true
val month_of_first_is_greater = is_older((2000,2,1), (2000,1,2)) = false
val month_of_second_is_greater = is_older((2000,1,2), (2000,2,1)) = true
val day_of_first_is_greater = is_older((2000,1,2), (2000,1,1)) = false
val day_of_secound_is_greater = is_older((2000,1,1), (2000,1,2)) = true
val same_date = is_older((2000,1,1), (2000,1,1)) = false

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val months_in_the_middle = number_in_month([(2000,1,1), (1999,2,1), (1998,2,1), (2001,1,1)],2) = 2
val months_on_the_sides = number_in_month([(2000,1,1), (1999,2,1), (1998,2,1), (2001,1,1)],1) = 2

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val with_repeated_months = number_in_months ([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3]) = 3

(*
val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) =
            [(2012,2,28),(2011,3,31),(2011,4,28)]

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test9 = what_month 70 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
*)
