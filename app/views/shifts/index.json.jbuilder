json.calendar json.partial!('shifts/calendar.html.erb', my_user_shifts: @my_user_shifts, open_user_shifts: @open_user_shifts, year: @year, month: @month, mth: @mth, days: @days, current: @current)
