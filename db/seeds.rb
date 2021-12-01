Prize.destroy_all
puts "Deleted prizes"
Message.destroy_all
puts "Deleted all messages"
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

functional_role_names = ["Nurse manager", "Radiology nurse",
                         "Labor & delivery nurse", "Emergency-room nurse",
                         "Intensive-care-unit nurse"]

functional_roles = functional_role_names.map do |name|
  FunctionalRole.create!(name: name)
end
puts "Created #{functional_roles.length} functional roles"

user_admin = [true, false]
user_first_name = ["Peter", "Veronika", "Thomas", "Karl", "Morgan", "Tim",
                   "Marita", "Bernhard", "Bianca", "Sia", "Claudio", "Laura",
                   "Marie", "Luis", "Alex", "Manfred", "Alissa", "Ken",
                   "Sebastian", "Zita", "Andre", "Bernd", "Caspar", "David",
                   "Elena", "Fiona", "Gisela", "Hannah", "Inga", "Julia", "Kip",
                   "Ludwig", "Mona", "Nina", "Olga", "Paul", "Quentin", "Ria",
                   "Susi"]
user_last_name = ["Hill", "Landberg", "Hintermeyer", "Leoni", "Richardson",
                  "Lagerfeld", "Arana", "Apmann", "Arco", "Sadi", "Tiedemann",
                  "Wittelberg", "Neisemeier", "Iarossi", "Jenkara",
                  "Scherhausen", "Linkhammer", "Ginser", "Patoli", "Dahme",
                  "Zahl", "Yptos", "Xaver", "Wort", "Vogt", "Ullmann", "Tran",
                  "Seifert", "Reiter", "Quacks", "Guile", "Plinter", "Ortmann",
                  "Narso", "Muks", "Leiter", "Klug", "Jung", "Ifdah"]
user_additional_infos = ["Hey there - your cardiologist is here.",
                         "I am new to the team - whoop, whoop.", "Busy",
                         "📈🩺👨🏼‍⚕️", "Saving some babies! #neonatal",
                         "I want icecream 🍦", "👩🏼‍⚕️", "In the gym",
                         "Do not disturb - not taking any offers🤪",
                         "Nihil since causa", "29.05.2022", "💙",
                         "Passionate delivery nurse #lovemyjob",
                         "All these christmas lights 🎶🎵", "Tired😴",
                         "Hey there!", "We are expecting - so excited🤰🏼",
                         "Caught Covid 😥", "Looking forward to my vacantions.",
                         "I got a new pair of shoes😎", "Work work", "🥱", "😁",
                         "Habemus papam!", "Is typing...", "I know, right?!",
                         "🥶", "So cold outside...", "User details", "Meow!🐱",
                         "I'm a dogperson", "21 days until...", "Hey there!",
                         "42", "I like turtles", "Be your best self!", "🤩",
                         "Harder, better, stronger, faster", "What are thooose?"]
user_experience_level = ["Experienced", "Beginner"]

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
  user.photo.attach(io: File.open(File.join(Rails.root, "app/assets/images/#{index}.png")), filename: 'user')
  users << user
  index += 1
end
karl = User.create!(
  admin: true,
  first_name: "Richard",
  last_name: "Erics",
  additional_infos: user_additional_infos[0],
  experience_level: user_experience_level.sample,
  bonus_points: rand(0..10) * 5,
  functional_role_id: functional_roles.sample.id,
  email: "shmarl.shmonder@mailbox.com",
  password: "coachoo",
  password_confirmation: "coachoo"
)
karl.photo.attach(io: File.open(File.join(Rails.root, 'app/assets/images/karl.png')), filename: 'karl')
users << karl
vero = User.create!(
  admin: true,
  first_name: "Vero",
  last_name: "Laconita",
  additional_infos: user_additional_infos[0],
  experience_level: user_experience_level.sample,
  bonus_points: rand(0..10) * 5,
  functional_role_id: functional_roles.sample.id,
  email: "vero@mailbox.com",
  password: "shifted",
  password_confirmation: "shifted"
)
vero.photo.attach(io: File.open(File.join(Rails.root, 'app/assets/images/vero.png')), filename: 'vero')
users << vero
puts "Created #{users.length} users"

early = Slot.create!(
  name: "Early",
  start_time: Time.new(2021, 1, 1, 5, 45, 0),
  end_time: Time.new(2021, 1, 1, 14, 15, 0)
)
late = Slot.create!(
  name: "Late",
  start_time: Time.new(2021, 1, 1, 13, 45, 0),
  end_time: Time.new(2021, 1, 1, 22, 15, 0)
)
night = Slot.create!(
  name: "Night",
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
user_shifts = []
shift_dates.each do |date|
  users_copy = users.map { |u| u }
  x = 0
  slots.length.times do
    shift = Shift.create!(
      bonus_points: 0,
      slot_id: slots[x].id,
      date: date
    )
    shifts << shift
    users_per_shift = 5
    users_per_shift.times do
      user_shift = UserShift.new(
        user_id: users_copy.delete(users_copy.sample).id,
        shift_id: shift.id,
        bonus_points: 0,
        open: rand(1..100) < 2,
        details: "Standard shift"
      )
      user_shift.save!
      user_shifts << user_shift
    end
    x += 1
  end
end

user_shift_details_swap = ["Burned out... please someone take over",
                           "Have to go to the vet with my dog",
                           "My kids are sick", "I'm sick :(",
                           "Private circumstances",
                           "There's a family event I forgot, please jump in"]

open_user_shifts = user_shifts.select(&:open)
open_user_shifts.each do |shift|
  shift.details = user_shift_details_swap.sample
  shift.bonus_points += rand(0..5)
  shift.save!
end

puts "Created #{shifts.length} shifts"
puts "Created #{user_shifts.length} user shifts"

emergency_days = shifts.select { |shift| DateTime.now <= shift.date && (shift.date - DateTime.now) < 7 }

user_shift_details_emergency = ["Premature baby needs 1 to 1 care",
                                "Early delivery",
                                "Many intensive care patients - support needed",
                                "We have many emergency cases - help is needed",
                                "We will need some help on the station",
                                "We need help the in the operating room",
                                "Help needed for the oncology"]

emergency_shifts = []
rand(3..7).times do
  emergency_shift = UserShift.create!(
    user_id: nil,
    shift_id: emergency_days.sample.id,
    bonus_points: rand(3..10),
    open: true,
    details: user_shift_details_emergency.sample
  )
  emergency_shifts << emergency_shift
end
puts "Created #{emergency_shifts.length} emergencies"

Prize.create!(
  bonus_points: 50,
  prize: "One day off!"
)
Prize.create!(
  bonus_points: 50,
  prize: "A voucher of your choice for 100€."
)
puts "Created #{Prize.count} prizes"
