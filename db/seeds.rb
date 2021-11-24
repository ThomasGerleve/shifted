admin = [true, true, true, false, false, false, false, false, false, false, false, false, false, false, false]
first_name = ["Peter", "Veronika", "Thomas", "Karl", "Morgan", "Tim", "Marita", "Bernhard", "Bianca", "Sia", "Claudio", "Laura", "Marie", "Luis", "Alex", "Manfred", "Alissa", "Ken", "Sebastian", "Zita"]
last_name = ["Hill", "Landberg", "Hintermeyer", "Leoni", "Richardson", "Lagerfeld", "Arana", "Apmann", "Arco", "Sadi", "Tiedemann", "Wittelberg", "Neisemeier", "Iarossi", "Jenkara", "Scherhausen", "Linkhammer", "Ginser", "Patoli", "Dahme"]
additional_infos = ["Hey there - your cardiologist is here.", "I am new to the team - whoop, whoop.", "Busy", "📈🩺👨🏼‍⚕️", "Saving some babies! #neonatal", "I want icecream 🍦",  "👩🏼‍⚕️", "In the gym", "Do not disturb - not taking any offers🤪", "Nihil since causa", "29.05.2022", "💙", "Passionate delivery nurse #lovemyjob", "All these christmas lights 🎶🎵", "tired😴", "Hey there!", "Pregnant - so excited🤰🏼", "Caught Covid 😥", "Looking forward to my vacantions." "I got a new pair of shoes😎"]
experience_level = ["experienced", "experienced", "experienced", "beginner", "beginner", "experienced", "beginner", "experienced", "beginner", "experienced", "beginner", "experienced", "beginner", "experienced", "beginner", "beginner", "experienced", "beginner", "experienced", "experienced"]
# functional_role
names1 = ["nurse manager", "nurse manager", "nurse manager", "radiology nurse", "labor & delivery nurse", "emergency-room nurse", "intensive-care-unit nurse", "radiology nurse", "labor & delivery nurse", "emergency-room nurse", "intensive-care-unit nurse", "radiology nurse", "labor & delivery nurse", "emergency-room nurse", "intensive-care-unit nurse", "radiology nurse", "labor & delivery nurse", "emergency-room nurse", "intensive-care-unit nurse", "radiology nurse"]
# preferred_slots
weekday = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
# slots
names2 = ["early", "late", "night", "early", "late", "night", "early", "late", "night", "early", "late", "night", "early", "late", "night", "early", "late", "night", "early", "late"]
# date
dates = ["Dec 6, 21", "Dec 7, 21", "Dec 8, 21", "Dec 9, 21", "Dec 10, 21", "Dec 11, 21", "Dec 12, 21", "Dec 13, 21", "Dec 14, 21", "Dec 15, 21", "Dec 16, 21", "Dec 17, 21", "Dec 18, 21", "Dec 19, 21", "Dec 20, 21", "Dec 21, 21", "Dec 22, 21", "Dec 23, 21", "Dec 24, 21", "Dec 25, 21"]
# user_shifts
status = ["open", "assigned", "open", "assigned", "open", "assigned", "open", "assigned", "open", "open", "assigned", "open", "assigned", "open", "assigned", "open", "assigned", "open"]
details = ["Baby coming", "emergency - terrorist attack on the subway, 50 peole injured", "emergency - major car accident", "early delivery", "influx of Covid patients - support needed", "understaffed - people dropped due to sickness", "emergency", "we have many emmergency cases on our station - help is needed", "unforseen sickness - two people to jump in needed", "Baby coming", "emergency - accident on the highway, 20 peole injured", "emergency - major wild fire", "we need some help on the station", "early delivery", "influx of Covid patients - support needed", "understaffed - people dropped due to sickness", "emergency", "we need help the in the operating room today, just some broken legs😉", "we need help as a colleague cant join due to private circumstances - emergency room (expect standard shift)", "help needed for the oncology"]

names1.each do |name|
  FunctionalRole.create(name: names1)
end

index = 0
20.times do
  user = User.new(
    admin: admin[index],
    first_name: first_name[index],
    last_name: last_name[index],
    additional_infos: additional_infos[index],
    experience_level: experience_level[index],
    bonus_points: rand(4..30) * 5,
    functional_role: FunctionalRole.find_by(name: names1[index])
  )
  index += 1
end

# for the shifts later
names2.each do |name|
  Slot.create(name: names)
end

# dates.each do |date|
#   shift = Shift.new(
#     date: date,
#     slot: Slot.find_by(name: names2[index])
#   )
# end
