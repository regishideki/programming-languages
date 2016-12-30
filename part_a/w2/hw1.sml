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
      increment + number_in_month((tl dates), month)
    end

fun number_in_months(dates : (int*int*int) list, months : int list) =
  if null months then 0
  else
    let
      val current_month = hd months
    in
      number_in_month(dates, current_month) + number_in_months(dates, (tl months))
    end

fun dates_in_month(dates : (int*int*int) list, month : int) =
  if null dates then []
  else
    if (#2 (hd dates)) = month then (hd dates)::dates_in_month((tl dates), month) 
    else dates_in_month((tl dates), month)

fun append(xs : (int*int*int) list, ys : (int*int*int) list) =
  if null xs then ys
  else (hd xs)::append((tl xs), ys)

fun dates_in_months(dates : (int*int*int) list, months : int list) = 
  if null months then []
  else append(dates_in_month(dates, (hd months)),dates_in_months(dates, (tl months)))

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
  let
    fun aux(sum: int, numbers : int list, acc : int, n : int) =
      let
        val current_number = hd numbers
      in
        if acc >= sum then n - 1 else aux(sum, (tl numbers), acc + current_number, n + 1)
      end
  in
    aux(sum, numbers, 0, 0)
  end