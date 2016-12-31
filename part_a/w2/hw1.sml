fun is_older(date1 : int*int*int, date2 : int*int*int) =
  let
    val year1 = #1 date1
    val month1 = #2 date1
    val day1 = #3 date1
    val year2 = #1 date2
    val month2 = #2 date2
    val day2 = #3 date2
  in
    let
      val older_year = year2 > year1
      val same_year = year1 = year2
      val older_month = month2 > month1
      val same_month = month1 = month2
      val older_day = day2 > day1
    in
      older_year orelse (same_year andalso older_month) orelse (same_month andalso older_day)
    end
  end

fun number_in_month(dates : (int*int*int) list, month : int) =
  if null dates then 0
  else
    let
      val current_date = hd dates
      val current_month = #2 current_date
      val increment = if current_month = month then 1 else 0
    in
      increment + number_in_month(tl dates, month)
    end

fun number_in_months(dates : (int*int*int) list, months : int list) =
  if null months then 0
  else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates : (int*int*int) list, month : int) =
  if null dates then []
  else if #2 (hd dates) = month then (hd dates)::dates_in_month(tl dates, month) 
  else dates_in_month(tl dates, month)

fun dates_in_months(dates : (int*int*int) list, months : int list) = 
  if null months then []
  else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(words : string list, n : int) =
  if n = 1 then hd words
  else get_nth(tl words, n - 1)

fun date_to_string(year : int, month : int, day : int) =
  let
    val months_names = ["January", "February", "March", "April", "May", "June", "July", 
                        "August", "September", "October", "November", "December"]
    val month_name = get_nth(months_names, month)
  in
    month_name ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
  end

fun number_before_reaching_sum(sum : int, numbers : int list) =
  if sum <= hd numbers then 0
  else 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)

fun what_month(day : int) =
  let
    val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    number_before_reaching_sum(day, months) + 1
  end

fun month_range(day1 : int, day2 : int) =
  if day1 > day2 then [] 
  else what_month(day1)::month_range(day1 + 1, day2)

fun oldest(dates : (int*int*int) list) =
  if null dates then NONE
  else 
    let
      fun aux(dates : (int*int*int) list, max_date) =
        if null dates then max_date
        else if is_older(max_date, hd dates) then aux(tl dates, max_date)
        else aux(tl dates, hd dates)
    in
      SOME (aux(tl dates, hd dates))
    end