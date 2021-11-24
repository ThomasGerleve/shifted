functional_role_names = ["nurse manager", "radiology nurse", "labor & delivery nurse", "emergency-room nurse", "intensive-care-unit nurse"]

functional_roles = functional_role_names.map do |name|
  FunctionalRole.create(name: name)
end

user_admin = [true, false]
user_first_name = ["Peter", "Veronika", "Thomas", "Karl", "Morgan", "Tim", "Marita", "Bernhard", "Bianca", "Sia", "Claudio", "Laura", "Marie", "Luis", "Alex", "Manfred", "Alissa", "Ken", "Sebastian", "Zita"]
user_last_name = ["Hill", "Landberg", "Hintermeyer", "Leoni", "Richardson", "Lagerfeld", "Arana", "Apmann", "Arco", "Sadi", "Tiedemann", "Wittelberg", "Neisemeier", "Iarossi", "Jenkara", "Scherhausen", "Linkhammer", "Ginser", "Patoli", "Dahme"]
user_additional_infos = ["Hey there - your cardiologist is here.", "I am new to the team - whoop, whoop.", "Busy", "📈🩺👨🏼‍⚕️", "Saving some babies! #neonatal", "I want icecream 🍦",  "👩🏼‍⚕️", "In the gym", "Do not disturb - not taking any offers🤪", "Nihil since causa", "29.05.2022", "💙", "Passionate delivery nurse #lovemyjob", "All these christmas lights 🎶🎵", "tired😴", "Hey there!", "Pregnant - so excited🤰🏼", "Caught Covid 😥", "Looking forward to my vacantions." "I got a new pair of shoes😎"]
user_experience_level = ["experienced", "beginner"]

index = 0
users = []
20.times do
  user = User.create(
    admin: user_admin.sample,
    first_name: user_first_name[index],
    last_name: user_last_name[index],
    additional_infos: user_additional_infos[index],
    experience_level: user_experience_level.sample,
    bonus_points: rand(0..20) * 5,
    functional_role: functional_roles.sample.id
  )
  users << user
  index += 1
end

early = Slot.create(
  name: early,
  start_time: Time.new(0, 0, 0, 5, 45, 0, timezone("Europe/Berlin")),
  end_time: Time.new(0, 0, 0, 14, 15, 0, timezone("Europe/Berlin"))
)
late = Slot.create(
  name: late,
  start_time: Time.new(0, 0, 0, 13, 45, 0, timezone("Europe/Berlin")),
  end_time: Time.new(0, 0, 0, 22, 15, 0, timezone("Europe/Berlin"))
)
night = Slot.create(
  name: night,
  start_time: Time.new(0, 0, 0, 21, 45, 0, timezone("Europe/Berlin")),
  end_time: Time.new(0, 0, 0, 6, 15, 0, timezone("Europe/Berlin"))
)

slots = [early, late, night]

preferred_slot_weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

i = 0
20.times do
  PreferredSlot.create(
    user_id: users[i].id,
    slot_id: slots.sample.id,
    weekday: preferred_slot_weekdays.sample
  )
  i += 1
end

shift_dates = [Date.new(2021, 11, 27), Date.new(2021, 11, 28), Date.new(2021, 11, 29), Date.new(2021, 11, 30), Date.new(2021, 12, 1), Date.new(2021, 12, 2), Date.new(2021, 12, 3), Date.new(2021, 12, 4), Date.new(2021, 12, 5), Date.new(2021, 12, 6), Date.new(2021, 12, 7), Date.new(2021, 12, 8), Date.new(2021, 12, 9), Date.new(2021, 12, 10), Date.new(2021, 12, 11), Date.new(2021, 12, 12)]

shifts = []
j = 0
3.times do
  k = 0
  16.times do
    shift = Shift.create(
      shift_bonus_points: rand(0..10),
      slot_id: slots[j].id,
      date: shift_dates[k]
    )
    shifts << shift
    k += 1
  end
  j += 1
end

user_shift_open = [true, false]
user_shift_details_standard = ["Standard shift"]
user_shift_details_swap = ["burned out... please someone take over", "Have to go to the vet with my dog", "My kids are sick", "I'm sick :(", "private circumstances", "There is a family event i forgot, can someone please jump in for me?"]
user_shift_details_emergency = ["Premature baby needs 1 to 1 care", "emergency - terrorist attack on the subway, 50 peole injured", "emergency - major car accident", "early delivery", "influx of Covid patients - support needed", "we have many emmergency cases on our station - help is needed", "Baby coming", "we will need some help on the station", "we need help the in the operating room, nothing too serious😉", "help needed for the oncology"]

l = 0
16.times do
  m = 0
  3.times do
    n = 0
    5.times do
      UserShift.create(
        shift_bonus_points: rand(0..10),
        slot_id: slots[k].id,
        date: shift_dates[j]
      )
      shifts << shift
      n += 1
    end
    m += 1
  end
  l += 1
end
