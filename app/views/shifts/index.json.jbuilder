json.calendar json.partial!('shifts/calendar.html.erb', version: @version, shifts_controller_output: @shifts, year: @year, month: @month, mth: @mth, days: @days, current: @current)
