UserShift.destroy_all
puts "Deleted user shifts"
Shift.destroy_all
puts "Deleted shifts"
PreferredSlot.destroy_all
puts "Deleted preferred slots"
Slot.destroy_all
puts "Deleted slots"
User.destroy_all
puts "Deleted users"
FunctionalRole.destroy_all
puts "Deleted functional roles"

functional_role_names = ["nurse manager", "radiology nurse", "labor & delivery nurse", "emergency-room nurse", "intensive-care-unit nurse"]

functional_roles = functional_role_names.map do |name|
  FunctionalRole.create!(name: name)
end

user_admin = [true, false]
user_first_name = ["Peter", "Veronika", "Thomas", "Karl", "Morgan", "Tim", "Marita", "Bernhard", "Bianca", "Sia", "Claudio", "Laura", "Marie", "Luis", "Alex", "Manfred", "Alissa", "Ken", "Sebastian", "Zita"]
user_last_name = ["Hill", "Landberg", "Hintermeyer", "Leoni", "Richardson", "Lagerfeld", "Arana", "Apmann", "Arco", "Sadi", "Tiedemann", "Wittelberg", "Neisemeier", "Iarossi", "Jenkara", "Scherhausen", "Linkhammer", "Ginser", "Patoli", "Dahme"]
user_additional_infos = ["Hey there - your cardiologist is here.", "I am new to the team - whoop, whoop.", "Busy", "📈🩺👨🏼‍⚕️", "Saving some babies! #neonatal", "I want icecream 🍦",  "👩🏼‍⚕️", "In the gym", "Do not disturb - not taking any offers🤪", "Nihil since causa", "29.05.2022", "💙", "Passionate delivery nurse #lovemyjob", "All these christmas lights 🎶🎵", "tired😴", "Hey there!", "Pregnant - so excited🤰🏼", "Caught Covid 😥", "Looking forward to my vacantions." "I got a new pair of shoes😎"]
user_experience_level = ["experienced", "beginner"]

index = 0
users = []
20.times do
  user = User.create!(
    admin: user_admin.sample,
    first_name: user_first_name[index],
    last_name: user_last_name[index],
    additional_infos: user_additional_infos[index],
    experience_level: user_experience_level.sample,
    bonus_points: rand(0..20) * 5,
    functional_role_id: functional_roles.sample.id,
    email: "#{user_first_name[index]}.#{user_last_name[index]}@mailbox.com",
    password: "asdfff",
    password_confirmation: "asdfff"
  )
  users << user
  index += 1
end
puts "Created #{users.length} users"
early = Slot.create!(
  name: "early",
  start_time: Time.new(2021, 1, 1, 5, 45, 0),
  end_time: Time.new(2021, 1, 1, 14, 15, 0)
)
late = Slot.create!(
  name: "late",
  start_time: Time.new(2021, 1, 1, 13, 45, 0),
  end_time: Time.new(2021, 1, 1, 22, 15, 0)
)
night = Slot.create!(
  name: "night",
  start_time: Time.new(2021, 1, 1, 21, 45, 0),
  end_time: Time.new(2021, 1, 1, 6, 15, 0)
)
puts "Created 3 slots"

slots = [early, late, night]

preferred_slot_weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

i = 0
20.times do
  PreferredSlot.create!(
    user_id: users[i].id,
    slot_id: slots.sample.id,
    weekday: preferred_slot_weekdays.sample
  )
  i += 1
end
puts "Created 20 preferred slots"

shift_dates = [Date.new(2021, 12, 4), Date.new(2021, 12, 5), Date.new(2021, 12, 6), Date.new(2021, 12, 7), Date.new(2021, 12, 8), Date.new(2021, 12, 9), Date.new(2021, 12, 10), Date.new(2021, 12, 11), Date.new(2021, 12, 12), Date.new(2021, 12, 13), Date.new(2021, 12, 14), Date.new(2021, 12, 15), Date.new(2021, 12, 16), Date.new(2021, 12, 17), Date.new(2021, 12, 18), Date.new(2021, 12, 19), Date.new(2021, 12, 20)]

shifts = []
j = 0
3.times do
  k = 0
  16.times do
    shift = Shift.create!(
      bonus_points: rand(0..10),
      slot_id: slots[j].id,
      date: shift_dates[k]
    )
    shifts << shift
    k += 1
  end
  j += 1
end
puts "Created 48 shifts"

def create_new_user_shift(shift, users)
  user_shift_details_standard = "Standard shift"
  user_shift_details_swap = ["burned out... please someone take over", "Have to go to the vet with my dog", "My kids are sick", "I'm sick :(", "private circumstances", "There is a family event i forgot, can someone please jump in for me?"]
  user_shift = UserShift.new(
    user_id: users[rand(0..19)].id,
    shift_id: shift.id,
    bonus_points: shift.bonus_points,
    open: (rand(1..100) < 11),
    details: user_shift_details_standard
  )
  while shift.user_shifts.any? { |u_shift| u_shift.user == User.find(user_shift.user_id) }
    user_shift = UserShift.new(
      user_id: users[rand(0..20)].id,
      shift_id: shift.id,
      bonus_points: shift.bonus_points,
      open: (rand(1..100) < 11),
      details: user_shift_details_standard
    )
  end
  user_shift.save!
  if user_shift.open
    user_shift.details = user_shift_details_swap.sample
    user_shift.bonus_points += rand(0..5)
    user_shift.save!
  end
end

user_shift_details_emergency = ["Premature baby needs 1 to 1 care", "emergency - terrorist attack on the subway, 50 peole injured", "emergency - major car accident", "early delivery", "influx of Covid patients - support needed", "we have many emmergency cases on our station - help is needed", "Baby coming", "we will need some help on the station", "we need help the in the operating room, nothing too serious😉", "help needed for the oncology"]

shifts.each do |shift|
  l = 0
  5.times do
    create_new_user_shift(shift, users)
    l += 1
  end
  if rand(1..100) < 11
    create_new_user_shift(shift, users)
    UserShift.last.details = user_shift_details_emergency.sample
  end
end
puts "Created about #{UserShift.count} user shifts"

Prize.new(
  bonus_points: 100,
  prize: "One day off!"
)
Prize.new(
  bonus_points: 100,
  prize: "A voucher of your choice for 100€."
)
