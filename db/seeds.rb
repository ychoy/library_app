# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all

User.create({
  first_name: 'Tombo',
  last_name: 'Violi',
  email: 'tombo@inventor.com',
  password: 'helloworld'
})

User.create({
  first_name: 'Barry',
  last_name: 'Obama',
  email: 'barry@obama.org',
  password: 'strangerthings'
})

User.create({
  first_name: 'Crystal',
  last_name: 'Teicho',
  email: 'crystal@me.com',
  password: 'hellohello'
})

User.create({
  first_name: 'Erik',
  last_name: 'Duval',
  email: 'duval@me.com',
  password: 'worldhello'
})

Library.destroy_all

Library.create({
  name: 'Dr. Martin Luther King Jr. Library',
  floor_count: 9,
  floor_area: 6708
 })

Library.create({
  name: 'Joyce Ellington Library',
  floor_count: 2,
  floor_area: 568
 })
