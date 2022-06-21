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
equipment1 = Equipment.create!(name: "Tools", details: "Compas", benefits: "Precise direction", price_estimation: 35)
equipment2 = Equipment.create!(name: "Shoes", details: "Hiking shoes", benefits: "Stamina", price_estimation: 109)
equipment3 = Equipment.create!(name: "Night", details: "Tent", benefits: "Solid", price_estimation: 82)
equipment3 = Equipment.create!(name: "Bags", details: "Backpack", benefits: "Organisation", price_estimation: 230)
equipment3 = Equipment.create!(name: "Clothes", details: "Lycra", benefits: "Water resistant", price_estimation: 45)

puts "SEED MATERIALS"
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

guide1 = Guide.create!(title: "Purify your water", content: "Water in the wild often contains harmful microorganisms,
  bacteria, and parasites that can cause a variety of ailments, such as giardia, dysentery, hepatitis, and hookworms.
  Luckily, however, we are going to learn a few simple ways how to purify water to make it safe for consumption.",
  author: "Léa Barus", category: "Water", difficulty: 3)

guide2 = Guide.create!(title: "Wilderness wound care", content: " When we travel to a distant country,  we can easily find
  ourselves with limited or delayed access to medical care. It is important to know some basic first aid techniques.
  The general steps covered here will help you care for injuries in an emergency, but this column is no substitute for
  proper first aid training.", author: "Valeria Pineda", category: "Wounds", difficulty: 2)

guide3 = Guide.create!(title: "Build a campire", content: "Lorem Ipsum is simply dummy text of the printing and typesetting
  industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a
  galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also
  the leap into electronic typesetting, remaining essentially unchanged. ", author: "Lina", category: "Fire", difficulty: 4)
