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

############# For Chat Rooms ##################################
puts 'Creating ChatRooms...'

############# For Challenge One ##################################

users_challenge1 = UsersChallenge.create(
  user: brad,
  challenge: challenge1,
  user_progress: 29
  )
users_challenge2 = UsersChallenge.create(
  user: dean,
  challenge: challenge1,
  user_progress: 17
  )
users_challenge3 = UsersChallenge.create(
  user: alisa,
  challenge: challenge1,
  user_progress: 3
  )

############# For Challenge Two ##################################
puts 'Creating UsersChallenges...'

users_challenge4 = UsersChallenge.create(
  user: brad,
  challenge: challenge2,
  user_progress: 35
  )
users_challenge5 = UsersChallenge.create(
  user: omer,
  challenge: challenge2,
  user_progress: 48
  )

############# For Challenge Three ##################################
users_challenge6 = UsersChallenge.create(
  user: brad,
  challenge: challenge3,
  user_progress: 3
  )
users_challenge7 = UsersChallenge.create(
  user: omer,
  challenge: challenge3,
  user_progress: 4
  )
users_challenge8 = UsersChallenge.create(
  user: alisa,
  challenge: challenge3,
  user_progress: 4
  )
users_challenge9 = UsersChallenge.create(
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
check_in1 = CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 146)
check_in2 = CheckIn.create(users_challenge_id: users_challenge4.id, completed: true, duration: nil, date: Date.today - 170)
check_in3 = CheckIn.create(users_challenge_id: users_challenge5.id, completed: true, duration: nil, date: Date.today - 43)
check_in1.remote_photo_url = 'https://www.uberchord.com/wp-content/uploads/2015/04/Songwriters-Paradise-Songwriting-1024x720.jpg'
check_in1.save
check_in2.remote_photo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR79KfmmPPz7Iz7rJsg_eOv29x4LkUPGELAsGUDDipONAi1PbCy&s'
check_in2.save
check_in3.remote_photo_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR79KfmmPPz7Iz7rJsg_eOv29x4LkUPGELAsGUDDipONAi1PbCy&s'
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
check_in4 = CheckIn.create(users_challenge_id: users_challenge8.id, completed: true, duration: nil, date: Date.today - 43)
check_in5 = CheckIn.create(users_challenge_id: users_challenge7.id, completed: true, duration: nil, date: Date.today - 46)
check_in6 = CheckIn.create(users_challenge_id: users_challenge6.id, completed: true, duration: nil, date: Date.today - 21)

check_in4.remote_photo_url = 'https://cortexitrecruitment.com/wp-content/uploads/2015/08/laptop-guy.jpg'
check_in4.save
check_in5.remote_photo_url = 'https://www.explore-group.com/storage/images-processed/w-1500_h-auto_m-fit_s-any__highres_464010407.jpeg'
check_in5.save
check_in6.remote_photo_url = 'https://www.romania-insider.com/sites/default/files/styles/article_large_image/public/featured_images/Academy-Plus.jpg'
check_in6.save

############# Achievements ##################################
puts 'Creating Wins...'
Win.create(challenge_id: challenge3.id, user_id: brad.id)
Win.create(challenge_id: challenge2.id, user_id: brad.id)




