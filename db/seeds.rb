# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "Destroy Everything"

Budget.destroy_all
Story.destroy_all
Material.destroy_all
Equipment.destroy_all
TripActivity.destroy_all
Trip.destroy_all
Activity.destroy_all
User.destroy_all
Guide.destroy_all

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

user4= User.create!(first_name: 'Vincente', last_name: 'Henry', username: 'Vincent Henry', email: 'Vincent@gmail.com', password: 'lololo', password_confirmation: 'lololo', phone_number: '0678682517', followers: '122', following: '143')
file4 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1654591985/oi5jpyxnwf2oitdzxxyt.jpg")
user4.photo.attach(io: file4, filename: 'pdp4', content_type: 'image/jpg')


puts "SEED TRIPS"
trip1= Trip.create!(destination: 'Iceland', start_date: '20/06/21', end_date: '20/08/21', budget: 200000 , user: user1)
trip2= Trip.create!(destination: 'Mexico', start_date: '20/08/21', end_date: '20/09/21', budget: 100000, user: user2)
trip3= Trip.create!(destination: 'Sri Lanka', start_date: '20/12/21', end_date: '20/05/22', budget: 90000, user: user3)

puts "SEED ACTIVITIES"

Activity::ACTIVITIES.each do |name|
  Activity.create!(name: name)
end

puts "SEED TRIP ACTIVITIES"
Trip.all.each do |t|
  TripActivity.create!(trip: t, activity: Activity.all.sample)
end

puts "SEED EQUIPMENTS"
# equipment1 = Equipment.create!(name: "Tools", details: "Compas", benefits: "Precise direction", price_estimation: 35)
# equipment2 = Equipment.create!(name: "Shoes", details: "Hiking shoes", benefits: "Stamina", price_estimation: 109)
# equipment3 = Equipment.create!(name: "Night", details: "Tent", benefits: "Solid", price_estimation: 82)
# equipment4 = Equipment.create!(name: "Bags", details: "Backpack", benefits: "Organisation", price_estimation: 230)
# equipment5 = Equipment.create!(name: "Clothes", details: "Lycra", benefits: "Water resistant", price_estimation: 45)
# equipment6 = Equipment.create!(name: "Accessories", details: "Plus", benefits: "Water resistant", price_estimation: 145)

hiking_shoes = Equipment.create!(name: "Shoes", details: "Intermediate", benefits: "Comfort & Stamina", price_estimation: 42)
hiking_night = Equipment.create!(name: "Tent", details: "3 seats", benefits: "Isolation & Comfort", price_estimation: 94)
hiking_bags = Equipment.create!(name: "Bag", details: "Intermediate", benefits: "Compartmented & waterproof", price_estimation: 39)
hiking_clothes = Equipment.create!(name: "Jacket", details: "Waterproof jacket", benefits: "lightness & Waterproof", price_estimation: 139)

climbing_tools = Equipment.create!(name: "Rope", details: "15m", benefits: "High support", price_estimation: 32)
climbing_night = Equipment.create!(name: "Tent", details: "3 seats", benefits: "Isolation & Comfort", price_estimation: 94)
climbing_clothes = Equipment.create!(name: "Jacket", details: "Resistant Jacket", benefits: "Resistant & Flexible", price_estimation: 150)

surf_bag = Equipment.create!(name: "Bag", details: "Soft bag", benefits: "Big storage space", price_estimation: 69)
surf_clothes = Equipment.create!(name: "Wetsuit", details: "Surf suit", benefits: "Resistant & Flexible", price_estimation: 269)

scuba_tools = Equipment.create!(name: "Palm", details: "Scuba Diving Palm", benefits: "lightness & Flexible", price_estimation: 55)
scuba_clothes = Equipment.create!(name: "Clothes", details: "Waterproof", benefits: "lightness & Flexible", price_estimation: 59)
scuba_accessories = Equipment.create!(name: "Camera", details: "Camera water housing", benefits: "Water resistant & solid ", price_estimation: 437)

sightseeing_shoes = Equipment.create!(name: "Shoes", details: "Newbie", benefits: "lightness & Comfort", price_estimation: 32)
sightseeing_bags = Equipment.create!(name: "Bag", details: "Intermediate", benefits: "Compartmented & lightness", price_estimation: 45)
sightseeing_clothes = Equipment.create!(name: "Clothes", details: "Basic", benefits: "Comfort & Flexible", price_estimation: 21)

biking_shoes = Equipment.create!(name: "Shoes", details: "Expert", benefits: "Solid & Stamina", price_estimation: 65)
biking_bags = Equipment.create!(name: "Bag", details: "Intermadiate", benefits: "Comfort & Lightness", price_estimation: 46)
biking_clothes = Equipment.create!(name: "Clothes", details: "Intermadiate", benefits: "Comfort & Flexible", price_estimation: 19)
biking_tools = Equipment.create!(name: "Helmet", details: "Intermadiate", benefits: "Solid & Lightness", price_estimation: 70)


# puts "SEED MATERIALS"

# material1 = Material.create!(equipment_id: [hiking_shoes, hiking_night, hiking_bags, hiking_clothes], activity_id: 169)
# material2 = Material.create!(equipment_id: [climbing_tools, climbing_night, climbing_clothes], activity_id: 170)
# material3 = Material.create!(equipment_id: [surf_bag, surf_clothes], activity_id: 171)
# material4 = Material.create!(equipment_id: [scuba_tools, scuba_clothes, scuba_accessories], activity_id: 172)
# material5 = Material.create!(equipment_id: [sightseeing_shoes, sightseeing_bags, sightseeing_clothes], activity_id: 173)
# material6 = Material.create!(equipment_id: [biking_shoes, biking_bags, biking_clothes, biking_tools], activity_id: 174)


Activity.all.each do |a|
  Material.create!(activity: a, equipment: Equipment.all.sample)
end

story1= Story.create!(title: "The best of Island ", content: "The discovery of the western fjords as well as the caldera of Aska...", location: 'Islande', trip: trip1, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie.", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file4 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655424162/mprtsiply9m8msx3c6ev.jpg")
story1.photo.attach(io: file4, filename: 'article1', content_type: 'image/jpg')

story2= Story.create!(title: "In the reserves of KwaZulu-Natal", content: "The second most populous province in South Africa...", location: 'Afrique', trip: trip2, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie.", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file5 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297237/n4dusqkef2van8janfzr.jpg")
story2.photo.attach(io: file5, filename: 'article2', content_type: 'image/jpg')

story3= Story.create!(title: "Brazil: journey along the Amazon", content: 'Confronting a myth is always risky, especially...', location: 'Amazonie', trip: trip3, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie.", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file6 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297187/cedns8sfu3xqtup7utpr.jpg")
story3.photo.attach(io: file6, filename: 'article3', content_type: 'image/jpg')

story4= Story.create!(title: "The best of Island ", content: "The discovery of the western fjords as well as the caldera of Aska...", location: 'Islande', trip: trip1, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie. Volcans", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file7 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297252/ncmbm3g9hv8e8wsskyjl.jpg")
story4.photo.attach(io: file7, filename: 'article4', content_type: 'image/jpg')

story5= Story.create!(title: "In the reserves of KwaZulu-Natal", content: "The second most populous province in South...", location: 'Afrique', trip: trip2, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie.", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file8 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655299155/fvrwakhcwiwduapy0oix.jpg")
story5.photo.attach(io: file8, filename: 'article5', content_type: 'image/jpg')

story6= Story.create!(title: "In the reserves of KwaZulu-Natal", content: "The second most populous province in South...", location: 'Afrique', trip: trip2, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie. Volcans, glaciers, champs de lave, chutes d'eau, zones géothermiques, bains naturels et plages de sable noir composent des paysages sauvages qui, selon le ciel et l’éclairage, évoquent le début ou la fin du monde.", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file9 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297237/n4dusqkef2van8janfzr.jpg")
story6.photo.attach(io: file9, filename: 'article6', content_type: 'image/jpg')

story7= Story.create!(title: "The best of Island ", content: "The discovery of the western fjords as well as the caldera of Aska...", location: 'Islande', trip: trip1, introduction: "Un voyage en Islande, terre des extrêmes et des contrastes, à la limite du cercle polaire, voilà l’occasion d’une fabuleuse leçon de géologie. Volcans, glaciers, champs de lave, chutes d'eau, zones géothermiques, bains naturels et plages de sable noir composent des paysages sauvages qui, selon le ciel et l’éclairage, évoquent le début ou la fin du monde.", description:"Sa nature sauvage, ses phénomènes volcaniques, ses chutes d’eau indomptables et ses paysages sans bornes sont sa meilleure publicité. À l’extrémité de l’Europe, l’Islande est un fantasme pour amateurs de grands espaces. On y respire un air frais et volontiers humide qui renvoie à l’origine d’un monde plus propre, puissant et prenant.
  Sous les abords austères de ses immenses champs de lave et ses déserts de pierre intérieurs, l’Islande empile les sites remarquables : fjords grandioses, glaciers colossaux, piscines thermales naturelles délicieuses, falaises piquetées de macareux, fulmars et guillemots… sans oublier tous ces lieux qui renvoient à la colonisation viking, avec leurs murs de tourbe et leurs maisonnettes aux toits nappés d’herbe.
  Si certains visiteurs décident de s’offrir le tour complet de l’île en 10 ou 15 jours par la Route 1, il faudrait le double, au moins, pour faire justice au pays — mieux encore, explorer différents secteurs en plusieurs voyages." )
file10 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655297252/ncmbm3g9hv8e8wsskyjl.jpg")
story7.photo.attach(io: file10, filename: 'article7', content_type: 'image/jpg')

puts "SEEDS SURVIVAL GUIDE"

guide1 = Guide.create!(title: "Purify your water", content: "Water in the wild often contains harmful,
  bacteria, and parasites that can cause a variety of ailments...",
  author: "Léa Barus", category: "Water", difficulty: 3)
photo_guide1 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655816666/njrmooud8swh2e9djdjc.jpg")
guide1.photo.attach(io: photo_guide1, filename: 'water', content_type: 'image/jpg')

guide2 = Guide.create!(title: "Wilderness wound care", content: "When we travel to a distant country,  we can easily find
  ourselves with limited access to medical care....", author: "Valeria Pineda", category: "Wounds", difficulty: 2)
photo_guide2 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655852402/nchv3hksz0nztm9ysghy.jpg")
guide2.photo.attach(io: photo_guide2, filename: 'wound', content_type: 'image/jpg')

guide3 = Guide.create!(title: "Build a campfire", content: "This article explains the key steps for building a successful
  campfire, as well as fire etiquette tips...", author: "Lina El Amrani", category: "Fire", difficulty: 4)
photo_guide3 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655816638/xnl5zfxzuegk4rojz0vu.jpg")
guide3.photo.attach(io: photo_guide3, filename: 'wound', content_type: 'image/jpg')

guide4 = Guide.create!(title: "Useful knots", content: "Every true adventurer needs a couple of rope tying tricks up their
  sleeves...", author: "Raphaël Girin", category: "knots", difficulty: 3)
photo_guide4 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655973665/htqsn3qbmapvvr3bpxnq.jpg")
guide4.photo.attach(io: photo_guide4, filename: 'knot', content_type: 'image/jpg')

guide5 = Guide.create!(title: "Build a shelter", content: "Building an effective shelter can help protect you from
  hypothermia and the elements...", author: "Gwen Blond", category: "shelters", difficulty: 5)
photo_guide5 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655973676/slekokef2gslioue532b.jpg")
guide5.photo.attach(io: photo_guide5, filename: 'shelter', content_type: 'image/jpg')

guide6 = Guide.create!(title: "Make a spear", content: "With a simple spear, you can improve your odds of catching
  fish or other small creatures...", author: "Aurore Rey", category: "spears", difficulty: 3)
photo_guide6 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655973683/jhlo91fxk1ahypippaxe.jpg")
guide6.photo.attach(io: photo_guide6, filename: 'spear', content_type: 'image/jpg')

guide7 = Guide.create!(title: "Survival essentials", content: "Not sure what to include on your survival gear list?
  here are some helpful tips...", author: "Anthony Jebrayel", category: "essentials", difficulty: 1)
photo_guide7 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655973703/xusvdjzpthllmx8akmvj.jpg")
guide7.photo.attach(io: photo_guide7, filename: 'essentials', content_type: 'image/jpg')

guide8 = Guide.create!(title: "Reading a compass", content: "There are a few important things you should know
  about how a compass works....", author: "Florent Page", category: "compass", difficulty: 1)
photo_guide8 = URI.open("https://res.cloudinary.com/du6ejgggh/image/upload/v1655973694/ecmnwkvjdvazxzgpka5y.jpg")
guide8.photo.attach(io: photo_guide8, filename: 'compass', content_type: 'image/jpg')
