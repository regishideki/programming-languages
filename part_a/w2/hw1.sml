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