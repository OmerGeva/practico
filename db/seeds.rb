puts 'Cleaning database...'

Skill.destroy_all
UsersChallenge.destroy_all
Message.destroy_all
ChatRoom.destroy_all
Challenge.destroy_all
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
user2 = User.create(
  email: 'noah@nash.com',
  password: '123456',
  first_name: 'Noah',
  last_name: 'Nash',
  username: 'noahnash'
  )
user3 = User.create(
  email: 'levy@henry.com',
  password: '123456',
  first_name: 'Levy',
  last_name: 'Henry',
  username: 'levyhenry'
  )
user4 = User.create(
  email: 'omer@geva.com',
  password: '123456',
  first_name: 'Omer',
  last_name: 'Geva',
  username: 'omergeva'
  )
user5 = User.create(
  email: 'brad@korman.com',
  password: '123456',
  first_name: 'Brad',
  last_name: 'Korman',
  username: 'bradkorman'
  )
user6 = User.create(
  email: 'alisa@silina.com',
  password: '123456',
  first_name: 'Alisa',
  last_name: 'Silina',
  username: 'alisasilina'
  )
user7 = User.create(
  email: 'david@sellam.com',
  password: '123456',
  first_name: 'David',
  last_name: 'Sellam',
  username: 'davidsellam'
  )
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
  starting_date: Date.today,
  first_place: "Gets lunch from loser",
  last_place: "Buys winner lunch",
  description: "Not Smoking for consecutive days",
  time_type: 'days',
  count_type: 'in a row',
  )
chatroom1 = ChatRoom.create(
  challenge_id: challenge1.id,
  name: skill1.title,
  )
challenge2 = Challenge.create(
  skill: skill2,
  milestone: 500,
  starting_date: Date.today,
  first_place: "Gets a trip to Japan paid for by loser",
  last_place: "Pays for the winner's trip to Japan",
  description: "Learning Japanese for a certain amount of hours",
  time_type: 'hours',
  count_type: 'total'
  )
chatroom2 = ChatRoom.create(
  challenge_id: challenge2.id,
  name: skill2.title,
  )
challenge3 = Challenge.create(
  skill: skill3,
  milestone: 100,
  starting_date: Date.today,
  first_place: "Gets lunch from loser",
  last_place: "Buys winner lunch",
  description: "Working on doing a handstand for consecutive days, winner has to be able to do it for 10 seconds without moving.",
  time_type: 'days',
  count_type: 'in a row'
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
