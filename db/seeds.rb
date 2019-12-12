puts 'Cleaning database...'

Message.destroy_all
ChatRoom.destroy_all
Event.destroy_all
UsersChallenge.destroy_all
Challenge.destroy_all
Skill.destroy_all
User.destroy_all

############# Users ##################################
puts 'Creating users...'

user1 = User.create(
  email: 'sponge@bob.com',
  password: '123456',
  first_name: 'Sponge',
  last_name: 'Bob',
  username: 'spongebob'
  )
user1.remote_photo_url = 'https://res.cloudinary.com/dv2x1zvtu/image/upload/v1574676603/SpongeBob_stock_art_wxxisz.png'
user1.save

user2 = User.create(
  email: 'noah@nash.com',
  password: '123456',
  first_name: 'Noah',
  last_name: 'Nash',
  username: 'noahnash'
  )
user2.remote_photo_url = 'https://res.cloudinary.com/dv2x1zvtu/image/upload/v1574845946/Users/NoahNash_pco64j.jpg'
user2.save

user3 = User.create(
  email: 'levy@henry.com',
  password: '123456',
  first_name: 'Levy',
  last_name: 'Henry',
  username: 'levyhenry'
  )
user3.remote_photo_url = 'https://res.cloudinary.com/dv2x1zvtu/image/upload/v1574846398/Users/LevyHenry_kk3qiu.jpg'
user3.save

omer = User.create(
  email: 'omer@geva.com',
  password: '123456',
  first_name: 'Omer',
  last_name: 'Geva',
  username: 'omergeva'
  )
omer.remote_photo_url = 'https://avatars2.githubusercontent.com/u/54701359?v=4'
omer.save

brad = User.create(
  email: 'brad@korman.com',
  password: '123456',
  first_name: 'Brad',
  last_name: 'Korman',
  username: 'bradkorman'
  )
brad.remote_photo_url = 'https://avatars2.githubusercontent.com/u/54051432?v=4'
brad.save

alisa = User.create(
  email: 'alisa@silina.com',
  password: '123456',
  first_name: 'Alisa',
  last_name: 'Silina',
  username: 'alisasilina'
  )
alisa.remote_photo_url = 'https://avatars0.githubusercontent.com/u/54353429?v=4'
alisa.save

david = User.create(
  email: 'david@sellam.com',
  password: '123456',
  first_name: 'David',
  last_name: 'Sellam',
  username: 'davidsellam'
  )
david.remote_photo_url = 'https://avatars1.githubusercontent.com/u/37403593?v=4'
david.save

dean = User.create(
  email: 'dean@wheeler.com',
  password: '123456',
  first_name: 'Dean',
  last_name: 'Wheeler',
  username: 'deanwheeler'
  )
dean.remote_photo_url = 'https://avatars2.githubusercontent.com/u/35640022?v=4'
dean.save

############# Friendships ##################################

puts 'Making friends...'

brad.friend_request(alisa)
alisa.accept_request(brad)

brad.friend_request(omer)
omer.accept_request(brad)

brad.friend_request(dean)
dean.accept_request(brad)

brad.friend_request(david)
david.accept_request(brad)

brad.friend_request(user1)

user2.friend_request(brad)

############# Skills ##################################
puts 'Creating skills...'

quit_smoking = Skill.create(
  title: 'Quit Smoking'
  )
guitar = Skill.create(
  title: 'Practice Guitar'
  )
code = Skill.create(
  title: 'Code Practico'
  )
salsa = Skill.create(
  title: 'Learn Salsa'
  )
muay_thai = Skill.create(
  title: 'Train Muay Thai'
  )
screenplay = Skill.create(
  title: 'Write my screenplay'
  )
############# Challenges ##################################
puts 'Creating challenges...'

challenge1 = Challenge.create(
  skill: quit_smoking,
  milestone: 30,
  starting_date: Date.parse('31-12-2019'),
  first_place: "Gets drinks from loser",
  last_place: "Buys winner drinks",
  description: "Not Smoking for consecutive days",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'checkbox',
  photo_proof: false
  )
chatroom1 = ChatRoom.create(
  challenge_id: challenge1.id,
  name: quit_smoking.title,
  )
challenge2 = Challenge.create(
  skill: guitar,
  milestone: 50,
  starting_date: Date.parse('31-12-2019'),
  first_place: "Gets new guitar strings",
  last_place: "Buys winner guitar strings",
  description: "Practice guitar for a certain amount of hours",
  time_type: 'hours',
  count_type: 'total',
  validation_type: 'duration',
  photo_proof: true
  )
chatroom2 = ChatRoom.create(
  challenge_id: challenge2.id,
  name: guitar.title,
  )
challenge3 = Challenge.create(
  skill: code,
  milestone: 14,
  starting_date: Date.parse('31-12-2019'),
  first_place: "Gets a job at Google",
  last_place: "Has to TA the next batch",
  description: "Work on Practico, the app.",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'checkbox',
  photo_proof: true
  )
chatroom3 = ChatRoom.create(
  challenge_id: challenge3.id,
  name: code.title,
  )
challenge4 = Challenge.create(
  skill: salsa,
  milestone: 14,
  starting_date: Date.parse('31-12-2019'),
  first_place: "reward",
  last_place: "penalty",
  description: "Salsa",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'checkbox',
  photo_proof: true
  )
chatroom4 = ChatRoom.create(
  challenge_id: challenge4.id,
  name: salsa.title,
  )
challenge5 = Challenge.create(
  skill: muay_thai,
  milestone: 14,
  starting_date: Date.parse('31-12-2019'),
  first_place: "reward",
  last_place: "penalty",
  description: "Salsa",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'checkbox',
  photo_proof: true
  )
chatroom5 = ChatRoom.create(
  challenge_id: challenge4.id,
  name: muay_thai.title,
  )
challenge6 = Challenge.create(
  skill: screenplay,
  milestone: 14,
  starting_date: Date.parse('31-12-2019'),
  first_place: "reward",
  last_place: "penalty",
  description: "Salsa",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'checkbox',
  photo_proof: true
  )
chatroom6 = ChatRoom.create(
  challenge_id: challenge4.id,
  name: screenplay.title,
  )
############# For Chat Rooms ##################################
puts 'Creating ChatRooms...'

############# For Challenge One ##################################
puts 'Creating UsersChallenges...'

# SMOKING
users_challenge1 = UsersChallenge.create(
  user: brad,
  challenge: challenge1,
  user_progress: 29
  )
users_challenge2 = UsersChallenge.create(
  accepted: true,
  user: dean,
  challenge: challenge1,
  user_progress: 17
  )
users_challenge3 = UsersChallenge.create(
  accepted: true,
  user: alisa,
  challenge: challenge1,
  user_progress: 3
  )

############# For Challenge Two ##################################

# GUITAR
users_challenge4 = UsersChallenge.create(
  accepted: true,
  user: brad,
  challenge: challenge2,
  user_progress: 35
  )
users_challenge5 = UsersChallenge.create(
  accepted: true,
  user: omer,
  challenge: challenge2,
  user_progress: 48
  )

############# For Challenge Three ##################################

# PRACTICO
users_challenge6 = UsersChallenge.create(
  accepted: true,
  user: brad,
  challenge: challenge3,
  user_progress: 13
  )
users_challenge7 = UsersChallenge.create(
  accepted: true,
  user: omer,
  challenge: challenge3,
  user_progress: 4
  )
users_challenge8 = UsersChallenge.create(
  accepted: true,
  user: alisa,
  challenge: challenge3,
  user_progress: 4
  )
users_challenge9 = UsersChallenge.create(
  accepted: true,
  user: dean,
  challenge: challenge3,
  user_progress: 3
  )
############# Check Ins ##################################
puts 'Creating Check Ins...'
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 80)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 90)
CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: nil, date: Date.today - 240)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 30)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 230)
CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: nil, date: Date.today - 210)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 10)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 240)
CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: nil, date: Date.today - 27)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 45)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 52)
CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: nil, date: Date.today - 22)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 46)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 146)
CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: nil, date: Date.today - 170)
CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 43)
check_in1 = CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: 1.0, date: Date.today - 1)
check_in2 = CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: 1.5, date: Date.today - 2)
check_in3 = CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: 1.0, date: Date.today - 5)
check_in1.remote_photo_url = 'https://res.cloudinary.com/daf8abic5/image/upload/v1576148284/brad_checkin1_s7skqs.jpg'
check_in1.save
check_in2.remote_photo_url = 'https://res.cloudinary.com/daf8abic5/image/upload/v1576148283/omer_checkin1_kvcxqp.jpg'
check_in2.save
check_in3.remote_photo_url = 'https://res.cloudinary.com/daf8abic5/image/upload/v1576148277/omer_checkin2_yzaf1s.jpg'
check_in3.save

CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 80)
CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 90)

CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 240)
CheckIn.create(users_challenge_id: users_challenge8.id, completed: true, duration: nil, date: Date.today - 30)
CheckIn.create(users_challenge_id: users_challenge9.id, completed: true, duration: nil, date: Date.today - 230)
CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 210)
CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 10)
CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 240)
CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 27)
CheckIn.create(users_challenge_id: users_challenge8.id, completed: true, duration: nil, date: Date.today - 45)
CheckIn.create(users_challenge_id: users_challenge9.id, completed: true, duration: nil, date: Date.today - 52)
CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 22)
CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 59)
CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 146)
CheckIn.create(users_challenge_id: users_challenge9.id, completed: true, duration: nil, date: Date.today - 170)
CheckIn.create(users_challenge_id: users_challenge8.id, completed: true, duration: nil, date: Date.today - 43)
CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 46)
CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 21)

check_in4 = CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 1)
check_in5 = CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 2)
check_in6 = CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 3)

check_in4.remote_photo_url = 'https://res.cloudinary.com/daf8abic5/image/upload/v1576148384/IMG_0527_gjglad.jpg'
check_in4.save
check_in5.remote_photo_url = 'https://res.cloudinary.com/daf8abic5/image/upload/v1576144437/421735C8-4B25-4896-88F9-1287BCAD4E13_lafjqo.jpg'
check_in5.save
check_in6.remote_photo_url = 'https://res.cloudinary.com/daf8abic5/image/upload/v1576144437/421735C8-4B25-4896-88F9-1287BCAD4E13_lafjqo.jpg'
check_in6.save

############# Achievements ##################################
puts 'Creating Wins...'
Win.create(challenge_id: challenge4.id, user_id: brad.id, date: Date.today - 21)
Win.create(challenge_id: challenge5.id, user_id: brad.id, date: Date.today - 54)
Win.create(challenge_id: challenge6.id, user_id: brad.id, date: Date.today - 521)



