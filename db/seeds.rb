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

user4 = User.create(
  email: 'omer@geva.com',
  password: '123456',
  first_name: 'Omer',
  last_name: 'Geva',
  username: 'omergeva'
  )
user4.remote_photo_url = 'https://avatars2.githubusercontent.com/u/54701359?v=4'
user4.save

user5 = User.create(
  email: 'brad@korman.com',
  password: '123456',
  first_name: 'Brad',
  last_name: 'Korman',
  username: 'bradkorman'
  )
user5.remote_photo_url = 'https://avatars2.githubusercontent.com/u/54051432?v=4'
user5.save

user6 = User.create(
  email: 'alisa@silina.com',
  password: '123456',
  first_name: 'Alisa',
  last_name: 'Silina',
  username: 'alisasilina'
  )
user6.remote_photo_url = 'https://avatars0.githubusercontent.com/u/54353429?v=4'
user6.save

user7 = User.create(
  email: 'david@sellam.com',
  password: '123456',
  first_name: 'David',
  last_name: 'Sellam',
  username: 'davidsellam'
  )
user7.remote_photo_url = 'https://avatars1.githubusercontent.com/u/37403593?v=4'
user7.save

user8 = User.create(
  email: 'dean@wheeler.com',
  password: '123456',
  first_name: 'Alisa',
  last_name: 'Silina',
  username: 'alisasilina'
  )
user8.remote_photo_url = 'https://avatars2.githubusercontent.com/u/35640022?v=4'
user8.save

############# Friendships ##################################

puts 'Making friends...'

user1.friend_request(user2)
user2.accept_request(user1)

user2.friend_request(user3)
user3.accept_request(user2)

user3.friend_request(user4)
user4.accept_request(user3)

user4.friend_request(user5)
user5.accept_request(user4)

user4.friend_request(user6)
user6.accept_request(user4)

user4.friend_request(user7)
user7.accept_request(user4)

user4.friend_request(user8)
user8.accept_request(user4)

user5.friend_request(user6)
user6.accept_request(user5)

user6.friend_request(user7)
user7.accept_request(user6)

user7.friend_request(user8)
user8.accept_request(user7)


############# Skills ##################################
puts 'Creating skills...'

skill1 = Skill.create(
  title: 'Quit Smoking'
  )
skill2 = Skill.create(
  title: 'Learn Japanese'
  )
skill3 = Skill.create(
  title: 'Learn to do a handstand'
  )
############# Challenges ##################################
puts 'Creating challenges...'

challenge1 = Challenge.create(
  skill: skill1,
  milestone: 100,
  starting_date: Date.parse('31-12-2019'),
  first_place: "Gets lunch from loser",
  last_place: "Buys winner lunch",
  description: "Not Smoking for consecutive days",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'checkbox'
  )
chatroom1 = ChatRoom.create(
  challenge_id: challenge1.id,
  name: skill1.title,
  )
challenge2 = Challenge.create(
  skill: skill2,
  milestone: 500,
  starting_date: Date.parse('31-12-2019'),
  first_place: "Gets a trip to Japan paid for by loser",
  last_place: "Pays for the winner's trip to Japan",
  description: "Learning Japanese for a certain amount of hours",
  time_type: 'hours',
  count_type: 'total',
  validation_type: 'duration'
  )
chatroom2 = ChatRoom.create(
  challenge_id: challenge2.id,
  name: skill2.title,
  )
challenge3 = Challenge.create(
  skill: skill3,
  milestone: 100,
  starting_date: Date.parse('31-12-2019'),
  first_place: "Gets lunch from loser",
  last_place: "Buys winner lunch",
  description: "Working on doing a handstand for consecutive days, winner has to be able to do it for 10 seconds without moving.",
  time_type: 'days',
  count_type: 'in a row',
  validation_type: 'photo, checkbox'
  )
chatroom3 = ChatRoom.create(
  challenge_id: challenge3.id,
  name: skill3.title,
  )



############# For Chat Rooms ##################################
puts 'Creating ChatRooms...'

############# For Challenge One ##################################

users_challenge4 = UsersChallenge.create(
  user: user2,
  challenge: challenge1,
  user_progress: 112
  )
users_challenge5 = UsersChallenge.create(
  user: user3,
  challenge: challenge1,
  user_progress: 93
  )

############# For Challenge Two ##################################
puts 'Creating UsersChallenges...'

users_challenge1 = UsersChallenge.create(
  user: user1,
  challenge: challenge2,
  user_progress: 20
  )
users_challenge2 = UsersChallenge.create(
  user: user2,
  challenge: challenge2,
  user_progress: 12
  )
users_challenge3 = UsersChallenge.create(
  user: user3,
  challenge: challenge2,
  user_progress: 43
  )
############# For Challenge Three ##################################
users_challenge6 = UsersChallenge.create(
  user: user1,
  challenge: challenge3,
  user_progress: 34
  )
users_challenge7 = UsersChallenge.create(
  user: user3,
  challenge: challenge3,
  user_progress: 56
  )
