Prize.destroy_all
puts "Deleted prizes"
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

functional_role_names = ["nurse manager", "radiology nurse",
                         "labor & delivery nurse", "emergency-room nurse",
                         "intensive-care-unit nurse"]

functional_roles = functional_role_names.map do |name|
  FunctionalRole.create!(name: name)
end
puts "Created #{functional_roles.length} functional roles"

user_admin = [true, false]
user_first_name = ["Peter", "Veronika", "Thomas", "Karl", "Morgan", "Tim",
                   "Marita", "Bernhard", "Bianca", "Sia", "Claudio", "Laura",
                   "Marie", "Luis", "Alex", "Manfred", "Alissa", "Ken",
                   "Sebastian", "Zita"]
user_last_name = ["Hill", "Landberg", "Hintermeyer", "Leoni", "Richardson",
                  "Lagerfeld", "Arana", "Apmann", "Arco", "Sadi", "Tiedemann",
                  "Wittelberg", "Neisemeier", "Iarossi", "Jenkara",
                  "Scherhausen", "Linkhammer", "Ginser", "Patoli", "Dahme"]
user_additional_infos = ["Hey there - your cardiologist is here.",
                         "I am new to the team - whoop, whoop.", "Busy",
                         "📈🩺👨🏼‍⚕️", "Saving some babies! #neonatal",
                         "I want icecream 🍦", "👩🏼‍⚕️", "In the gym",
                         "Do not disturb - not taking any offers🤪",
                         "Nihil since causa", "29.05.2022", "💙",
                         "Passionate delivery nurse #lovemyjob",
                         "All these christmas lights 🎶🎵", "tired😴",
                         "Hey there!", "We are expecting - so excited🤰🏼",
                         "Caught Covid 😥", "Looking forward to my vacantions.",
                         "I got a new pair of shoes😎"]
user_experience_level = ["experienced", "beginner"]

index = 0
users = []
user_first_name.length.times do
  user = User.create!(
    admin: user_admin.sample,
    first_name: user_first_name[index],
    last_name: user_last_name[index],
    additional_infos: user_additional_infos[index],
    experience_level: user_experience_level.sample,
    bonus_points: rand(0..10) * 5,
    functional_role_id: functional_roles.sample.id,
    email: "#{user_first_name[index]}.#{user_last_name[index]}@mailbox.com",
    password: "asdfff",
    password_confirmation: "asdfff"
  )
  users << user
  index += 1
end
karl = User.create!(
  admin: true,
  first_name: "Shmarl",
  last_name: "Shmonder",
  additional_infos: user_additional_infos[0],
  experience_level: user_experience_level.sample,
  bonus_points: rand(0..10) * 5,
  functional_role_id: functional_roles.sample.id,
  email: "shmarl.shmonder@mailbox.com",
  password: "coachoo",
  password_confirmation: "coachoo"
)
users << karl
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
slots = [early, late, night]
puts "Created #{slots.length} slots"

preferred_slot_weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday",
                           "Friday", "Saturday", "Sunday"]

i = 0
preferred_slots = []
users.length.times do
  preferred_slot = PreferredSlot.create!(
    user_id: users[i].id,
    slot_id: slots.sample.id,
    weekday: preferred_slot_weekdays.sample
  )
  preferred_slots << preferred_slot
  i += 1
end
puts "Created #{preferred_slots.length} preferred slots"

shift_dates = [Date.new(2021, 11, 30), Date.new(2021, 12, 1),
               Date.new(2021, 12, 2), Date.new(2021, 12, 3),
               Date.new(2021, 12, 4), Date.new(2021, 12, 5),
               Date.new(2021, 12, 6), Date.new(2021, 12, 7),
               Date.new(2021, 12, 8), Date.new(2021, 12, 9),
               Date.new(2021, 12, 10), Date.new(2021, 12, 11),
               Date.new(2021, 12, 12), Date.new(2021, 12, 13),
               Date.new(2021, 12, 14), Date.new(2021, 12, 15),
               Date.new(2021, 12, 16), Date.new(2021, 12, 17),
               Date.new(2021, 12, 18), Date.new(2021, 12, 19),
               Date.new(2021, 12, 20), Date.new(2021, 12, 21),
               Date.new(2021, 12, 22), Date.new(2021, 12, 23),
               Date.new(2021, 12, 24), Date.new(2021, 12, 25),
               Date.new(2021, 12, 26), Date.new(2021, 12, 27),
               Date.new(2021, 12, 28), Date.new(2021, 12, 29),
               Date.new(2021, 12, 30), Date.new(2021, 12, 31),
               Date.new(2022, 1, 1), Date.new(2022, 1, 2),
               Date.new(2022, 1, 3), Date.new(2022, 1, 4),
               Date.new(2022, 1, 5), Date.new(2022, 1, 6),
               Date.new(2022, 1, 7), Date.new(2022, 1, 8),
               Date.new(2022, 1, 9), Date.new(2022, 1, 10),
               Date.new(2022, 1, 11), Date.new(2022, 1, 12),
               Date.new(2022, 1, 13), Date.new(2022, 1, 14),
               Date.new(2022, 1, 15), Date.new(2022, 1, 16),
               Date.new(2022, 1, 17), Date.new(2022, 1, 18),
               Date.new(2022, 1, 19), Date.new(2022, 1, 20),
               Date.new(2022, 1, 21), Date.new(2022, 1, 22),
               Date.new(2022, 1, 23), Date.new(2022, 1, 24),
               Date.new(2022, 1, 25), Date.new(2022, 1, 26),
               Date.new(2022, 1, 27), Date.new(2022, 1, 28),
               Date.new(2022, 1, 29), Date.new(2022, 1, 30)]

shifts = []
j = 0
slots.length.times do
  k = 0
  shift_dates.length.times do
    shift = Shift.create!(
      bonus_points: 0,
      slot_id: slots[j].id,
      date: shift_dates[k]
    )
    shifts << shift
    k += 1
  end
  j += 1
end
puts "Created #{shifts.length} shifts"

user_shift = UserShift.new(
  user_id: users[rand(0..users.length)].id,
  shift_id: shift.id,
  bonus_points: shift.bonus_points,
  open: (rand(1..100) < 11),
  details: "Standard shift"
)

user_shift_details_swap = ["burned out... please someone take over",
                           "Have to go to the vet with my dog",
                           "My kids are sick", "I'm sick :(",
                           "private circumstances",
                           "There's a family event I forgot, please jump in"]

user_shift_details_emergency = ["Premature baby needs 1 to 1 care",
                                "early delivery",
                                "many intensive care patients - support needed",
                                "we have many emergency cases - help is needed",
                                "we will need some help on the station",
                                "we need help the in the operating room",
                                "help needed for the oncology"]

def create_new_user_shift(shift, user_shift, user_shift_details_swap)
  user_shift while shift.user_shifts.any? { |u_shift| u_shift.user == User.find(user_shift.user_id) }
  user_shift.save!
  return unless user_shift.open

  user_shift.details = user_shift_details_swap.sample
  user_shift.bonus_points += rand(0..5)
  user_shift.save!
end

users_per_shift = 5
shifts.each do |shift|
  l = 0
  users_per_shift.times do
    create_new_user_shift(shift, user_shift, user_shift_details_swap)
    l += 1
  end
  if rand(1..100) < 11
    create_new_user_shift(shift, user_shift, user_shift_details_swap)
    UserShift.last.details = user_shift_details_emergency.sample
  end
end
puts "Created #{UserShift.count} user shifts"

Prize.create!(
  bonus_points: 50,
  prize: "One day off!"
)
Prize.create!(
  bonus_points: 50,
  prize: "A voucher of your choice for 100€."
)
puts "Created #{Prize.count} prizes"
