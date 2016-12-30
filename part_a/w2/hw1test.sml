(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your
   code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "./hw1.sml";
(*
Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.)
*)
val test1 = is_older ((1,2,3),(2,3,4)) = true
val year_of_first_is_greater = is_older((2000,1,1), (1999,2,2)) = false
val year_of_second_is_greater = is_older((2000,2,2), (2001,1,1)) = true
val month_of_first_is_greater = is_older((2000,2,1), (2000,1,2)) = false
val month_of_second_is_greater = is_older((2000,1,2), (2000,2,1)) = true
val day_of_first_is_greater = is_older((2000,1,2), (2000,1,1)) = false
val day_of_secound_is_greater = is_older((2000,1,1), (2000,1,2)) = true
val same_date = is_older((2000,1,1), (2000,1,1)) = false

(*
 Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month.
*)
val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val months_in_the_middle = number_in_month([(2000,1,1), (1999,2,1), (1998,2,1), (2001,1,1)],2) = 2
val months_on_the_sides = number_in_month([(2000,1,1), (1999,2,1), (1998,2,1), (2001,1,1)],1) = 2

(*
 Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem.
*)
val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val with_repeated_months = number_in_months ([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3]) = 3

(*
 Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a
list holding the dates from the argument list of dates that are in the month. The returned list should
contain dates in the order they were originally given.
*)
val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val with_more_than_one_result = dates_in_month ([(2012,2,28),(2013,12,1),(2013,2,1)],2) = [(2012,2,28),(2013,2,1)]

(*
Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns a list holding the dates from the argument list of dates that are in any of the months in
the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the
previous problem and SML’s list-append operator (@).
*)
val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) =
            [(2012,2,28),(2011,3,31),(2011,4,28)]

(*
Write a function get_nth that takes a list of strings and an int n and returns the nth element of the
list where the head of the list is 1st. Do not worry about the case where the list has too few elements:
your function may apply hd or tl to the empty list in this case, which is okay.
*)
val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

(*
Write a function date_to_string that takes a date and returns a string of the form January 20, 2013
(for example). Use the operator ^ for concatenating strings and the library function Int.toString
for converting an int to a string. For producing the month part, do not use a bunch of conditionals.
Instead, use a list holding 12 strings and your answer to the previous problem. For consistency, put a
comma following the day and use capitalized English month names: January, February, March, April,
May, June, July, August, September, October, November, December.
*)
val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

(*
Write a function number_before_reaching_sum that takes an int called sum, which you can assume
is positive, and an int list, which you can assume contains all positive numbers, and returns an int.
You should return an int n such that the first n elements of the list add to less than sum, but the first
n + 1 elements of the list add to sum or more. Assume the entire list sums to more than the passed in
value; it is okay for an exception to occur if this is not the case.
*)
val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

(*
Write a function what_month that takes a day of year (i.e., an int between 1 and 365) and returns
what month that day is in (1 for January, 2 for February, etc.). Use a list holding 12 integers and your
answer to the previous problem.

val test9 = what_month 70 = 3

Write a function month_range that takes two days of the year day1 and day2 and returns an int list
[m1,m2,...,mn] where m1 is the month of day1, m2 is the month of day1+1, ..., and mn is the month
of day day2. Note the result will have length day2 - day1 + 1 or length 0 if day1>day2.

val test10 = month_range (31, 34) = [1,2,2,2]

Write a function oldest that takes a list of dates and evaluates to an (int*int*int) option. It
evaluates to NONE if the list has no dates and SOME d if the date d is the oldest date in the list.

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

Challenge Problem: Write functions number_in_months_challenge and dates_in_months_challenge
that are like your solutions to problems 3 and 5 except having a month in the second argument multiple
times has no more effect than having it once. (Hint: Remove duplicates, then use previous work.)

Challenge Problem: Write a function reasonable_date that takes a date and determines if it
describes a real date in the common era. A “real date” has a positive year (year 0 did not exist), a
month between 1 and 12, and a day appropriate for the month. Solutions should properly handle leap
years. Leap years are years that are either divisible by 400 or divisible by 4 but not divisible by 100.
(Do not worry about days possibly lost in the conversion to the Gregorian calendar in the Late 1500s.)

*)
