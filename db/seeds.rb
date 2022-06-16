# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: ‘Lord of the Rings' }])
#   Character.create(name: ‘Luke', movie: movies.first)
require 'open-uri'

puts "Destroy Everything"

Story.destroy_all
Material.destroy_all
Equipment.destroy_all
TripActivity.destroy_all
Trip.destroy_all
Activity.destroy_all
User.destroy_all

puts "SEED USER"

user1= User.create!(first_name: 'Luke', last_name: 'Dumont', username: 'Lulu Dumont', email: 'lea@gmail.com', password: 'lololo', password_confirmation: 'lololo', phone_number: '0678682514', followers: '37', following: '63')
file1 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655298538/uc11vcwn5bwl2eqylvn4.png")
user1.photo.attach(io: file1, filename: 'pdp1', content_type: 'image/png')

user2= User.create!(first_name: 'Thomas', last_name: 'Tomassin', username: 'Thomas Tms', email: 'lina@gmail.com', password: 'lololo', password_confirmation: 'lololo', phone_number: '0678682515', followers: '27', following: '42')
file2 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655298845/d03xptj108jytbnunrxb.jpg")
user2.photo.attach(io: file2, filename: 'pdp2', content_type: 'image/jpg')

user3= User.create!(first_name: 'Clemence', last_name: 'Dubois', username: 'Clemence Dbs', email: 'valeria@gmail.com', password: 'lololo', password_confirmation: 'lololo', phone_number: '0678682516', followers: '68', following: '57')
file3 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655299155/fvrwakhcwiwduapy0oix.jpg")
user3.photo.attach(io: file3, filename: 'pdp3', content_type: 'image/jpg')

puts "SEED TRIPS"
trip1= Trip.create!(destination: 'Islande', start_date: '20/06/21', end_date: '20/08/21', budget: 200000 , user: user1)
trip2= Trip.create!(destination: 'Thailande', start_date: '20/08/21', end_date: '20/09/21', budget: 100000, user: user2)
trip3= Trip.create!(destination: 'Sri Lanka', start_date: '20/12/21', end_date: '20/05/22', budget: 90000, user: user3)

puts "SEED ACTIVITIES"
activity1 = Activity.create!(name: "Hiking")
activity2 = Activity.create!(name: "Climbing")
activity3 = Activity.create!(name: "Surf")
activity4 = Activity.create!(name: "Scuba Diving")
activity5 = Activity.create!(name: "Sightseeing")
activity6 = Activity.create!(name: "Biking")

puts "SEED TRIP ACTIVITIES"
tripact1= TripActivity.create!(trip: trip1, activity: activity2)
tripact2= TripActivity.create!(trip: trip3, activity: activity4)

puts "SEED EQUIPMENTS"
equipment1 = Equipment.create!(name: "Tools", details: "jdaojdoqror", benefits: "Survival", price_estimation: 50)
equipment2 = Equipment.create!(name: "Shoes & Bags", details: "jrorjowlldj", benefits: "Walking", price_estimation: 100)
equipment3 = Equipment.create!(name: "Night", details: "hdksdhkwksdh", benefits: "Sleeping", price_estimation: 200)

puts "SEED MATERIALS"
material1 = Material.create!(activity: activity1, equipment: equipment1)
material2 = Material.create!(activity: activity2, equipment: equipment2)
material3 = Material.create!(activity: activity3, equipment: equipment3)

puts "SEED STORIES"
story1= Story.create!(title: "titre de l'article", content: 'kjnnjknjhb jbhhjlb bhjhjb bhl', location: 'Islande', trip: trip1)
file4 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297219/uiokgauctwmwggjgzamq.jpg")
story1.photo.attach(io: file4, filename: 'article1', content_type: 'image/jpg')

story2= Story.create!(title: "titre de l'article", content: 'kjnnjknjhb jbhhjlb bhjhjb bhl', location: 'Afrique', trip: trip2)
file5 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297237/n4dusqkef2van8janfzr.jpg")
story2.photo.attach(io: file5, filename: 'article2', content_type: 'image/jpg')

story3= Story.create!(title: "titre de l'article", content: 'kjnnjknjhb jbhhjlb bhjhjb bhl', location: 'Amazonie', trip: trip3)
file6 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297187/cedns8sfu3xqtup7utpr.jpg")
story3.photo.attach(io: file6, filename: 'article2', content_type: 'image/jpg')
# puts "SEED ACTIVITIES"
# Activity::ACTIVITIES.each do |name|
#   Activity.create!(name: name)
# end
