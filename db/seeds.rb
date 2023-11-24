require "open-uri"
Offer.destroy_all
User.destroy_all
Reservation.destroy_all
puts 'Creating 12 users and each user has an offer...'
array_url = ["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/882367c8-9104-494d-8a9c-62384aa16beb/dftkr9n-15698c0a-cbab-4427-bbf2-0d52d21e58ff.jpg/v1/fill/w_894,h_894,q_70,strp/dnd_character_profile__2_by_hypnoman172feb_dftkr9n-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcLzg4MjM2N2M4LTkxMDQtNDk0ZC04YTljLTYyMzg0YWExNmJlYlwvZGZ0a3I5bi0xNTY5OGMwYS1jYmFiLTQ0MjctYmJmMi0wZDUyZDIxZTU4ZmYuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.WtRIuMnKQdyjlf-o2oLUr2wph9qLplT2ETIKqI6uXvM", "https://r2.starryai.com/results/507668513/852d5d14-0d02-4536-b33d-7045291bb41b.webp", "https://storage.googleapis.com/pai-images/c17d73f095a04d4d9c2fd3689b993c41.jpeg", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/842c4406-8fa0-436e-89c7-54c953cc20df/d9jn27d-92afe804-3d1b-42c3-ac17-f43a01d13c5e.jpg/v1/fill/w_510,h_700,q_70,strp/ellar_by_in2eternity_d9jn27d-350t-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9ODAwIiwicGF0aCI6IlwvZlwvODQyYzQ0MDYtOGZhMC00MzZlLTg5YzctNTRjOTUzY2MyMGRmXC9kOWpuMjdkLTkyYWZlODA0LTNkMWItNDJjMy1hYzE3LWY0M2EwMWQxM2M1ZS5qcGciLCJ3aWR0aCI6Ijw9NTgzIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.rnSGKI_JyK02EPjkQ0BnZyDZCDLKf4Ejyy47Tu8cxzY", "https://t4.ftcdn.net/jpg/05/71/19/33/240_F_571193377_obyyXxhLDYlOOPWhi2GOS5WGgzM4UiFx.jpg", "https://as2.ftcdn.net/v2/jpg/05/89/15/41/1000_F_589154156_ohBYQrjmRx9fwAXtG6hcV7mQ4j1BOqI7.jpg", "https://cdna.artstation.com/p/assets/images/images/009/202/780/large/lionel-dorviler-speed-chara-4-wip7-final.jpg?1517672511", "https://pics.craiyon.com/2023-05-27/472dd2c9401a47c48a896bf5b6b409c2.webp", "https://i.redd.it/8nq7ixsvtuk81.jpg", "https://png.pngtree.com/thumb_back/fw800/background/20230516/pngtree-the-ninja-image_2574632.jpg", "https://storage.googleapis.com/pai-images/4a02e5c0ed744e8da036e452e81cabde.jpeg", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cc8bb657-1354-40d3-ad4f-a016115e379a/d82jtov-0a31baf9-937b-46ad-b925-a5ebca6e7f59.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NjOGJiNjU3LTEzNTQtNDBkMy1hZDRmLWEwMTYxMTVlMzc5YVwvZDgyanRvdi0wYTMxYmFmOS05MzdiLTQ2YWQtYjkyNS1hNWViY2E2ZTdmNTkuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3Q0Edm_KWF2SLPqnSVrNPu8MNwWk40mKq_UjuwMMVzc", "https://img.freepik.com/photos-premium/photo-detaillee-du-loup-gris-portant-costume-guerrier_982005-5540.jpg?size=338&ext=jpg&ga=GA1.1.1880011253.1699747200&semt=ais"]
# job_list = ["Guerrier", "Mage", "Voleur", "Archer", "Ninja"]

user = User.create(
  user_name: "Thrain Rockfer",
  email: "test@test.fr",
  password: "azerty",
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Guerrier",
  rank: "A"
)
user.photo.attach(io: URI.open("#{array_url[0]}"), filename: "file#{user.rank}")
user.save!

# offer = Offer.create(
#   title: "Paladin des Cimes à louer",
#   price: 150,
#   address: "Forteresse de la Haute Crête",
#   description: "Mon nom est Thrain Rocfer, paladin des cimes et gardien des montagnes. Ma hache de Pierre-Éclat fend les rochers avec une force inébranlable, et mon honneur est aussi solide que la pierre des cimes. Je défends les montagnes contre toute menace, et ma loyauté envers mes compagnons est inébranlable. Mon repaire se trouve dans la Forteresse de la Haute Crête, où les sommets touchent le ciel. Engagez-moi si vous recherchez un protecteur dévoué des montagnes et un guerrier implacable.",
#   user_id: User.find_by(user_name: user.user_name).id,
#   job: user.job,
#   rank: user.rank
# )
# offer.photo.attach(io: URI.open("#{array_url[0]}"), filename: "file#{user.user_name}")
# offer.save!

user = User.create(
  user_name: "Pyrosphinx",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Mage",
  rank: "B"
)
user.photo.attach(io: URI.open("#{array_url[1]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Le danseur des flammes",
  price: 150,
  address: "Quartier des Arcanes, Tour de la Flamme Éternelle",
  description: "Je suis Pyrosphinx, maître des flammes qui danse au creux de mes mains. Ma magie embrase l'horizon, réduisant en cendres ceux qui osent défier la puissance du feu. Les contrats ardents sont ma passion, et la destruction est mon art. Si vous avez besoin de la chaleur dévastatrice de la magie du feu, je suis votre sorcier.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[1]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Mur de Fer",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Guerrier",
  rank: "A"
)
user.photo.attach(io: URI.open("#{array_url[2]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Le rempart indestructible",
  price: 80,
  address: "Forge du Bouclier, Rue des Armuriers",
  description: "Je suis Mur de Fer, le rempart indestructible qui défend contre les assauts du chaos. Mon bouclier est impénétrable, et ma loyauté est aussi solide que l'acier. Si vous cherchez un gardien pour veiller sur vos arrières, je suis prêt à être le mur qui sépare la vie de la mort.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[2]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Flèche d'Argent",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Archer",
  rank: "C"
)
user.photo.attach(io: URI.open("#{array_url[3]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "La précision mortelle",
  price: 120,
  address: "Bois d'Émeraude, Campement des Archers",
  description: "Je suis Flèche d'Argent, l'archer elfique dont la précision est légendaire. Mon regard perçant trouve sa cible, et ma flèche danse avec le vent pour atteindre son but. Que ce soit en chasse ou en guerre, engager mes services assure que chaque tir compte et que chaque ennemi est marqué du sceau de la défaite.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[3]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Ombreputride",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Mage",
  rank: "A"
)
user.photo.attach(io: URI.open("#{array_url[4]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "La magie nécromantique des marais",
  price: 130,
  address: "Marais des Âmes Perdues, Tanière de l'Ombre",
  description: "Ombreputride, la sorcière des marais, maîtresse des arts nécromantiques. Les âmes perdues répondent à mon appel, et la magie sombre coule dans mes veines. Si vous avez besoin de puissance occulte, de marées d'ombres et de serviteurs des ténèbres, vous ne trouverez pas de nécromancienne plus habile.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[4]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Antiarcane",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Mage",
  rank: "F"
)
user.photo.attach(io: URI.open("#{array_url[5]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Le maître de la contre-magie",
  price: 110,
  address: "Place du Savoir, Bibliothèque Interdite",
  description: "Je suis Antiarcane, le maître de la contre-magie. Les enchantements se brisent sous ma volonté, et les arcanes de mes ennemis se dissipent comme la brume du matin. Si vous cherchez à annihiler la magie adverse et à déjouer les sorts, engagez-moi, et la puissance mystique de vos adversaires ne sera qu'un souvenir.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[5]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Fauconfurtif",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Voleur",
  rank: "B"
)
user.photo.attach(io: URI.open("#{array_url[6]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "L'as du vol furtif",
  price: 90,
  address: "Repaire des Voleurs, Ruelle des Ombres",
  description: "Fauconfurtif, le voleur agile et l'as de la furtivité. Mes mains sont plus rapides que l'œil, et mes talents de pickpocket sont inégalés. Si vous avez besoin de compétences subtils pour récupérer des informations ou des trésors, faites appel à moi, le roi des ombres et des secrets.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[6]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Lumière Bienfaisante",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Guerrier",
  rank: "B"
)
user.photo.attach(io: URI.open("#{array_url[7]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "La lumière guérisseuse",
  price: 70,
  address: "Temple de la Lueur Divine, Salle des Guérisseurs",
  description: "Je suis Lumière Bienfaisante, le guérisseur béni par les cieux. Mes mains émettent une lumière apaisante qui guérit les blessures et dissipe les afflictions. Si vous cherchez la guérison divine et la protection céleste, mes services sont à votre disposition pour ramener la vie là où règne la souffrance.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[7]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Harmonibard",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Voleur",
  rank: "F"
)
user.photo.attach(io: URI.open("#{array_url[8]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Le ménestrel des enchantements magiques",
  price: 100,
  address: "Taverne de la Harpe d'Argent, Scène des Conteurs",
  description: "Je suis Harmonibard, maître des flammes qui danse au creux de mes mains. Ma magie embrase l'horizon, réduisant en cendres ceux qui osent défier la puissance du feu. Les contrats ardents sont ma passion, et la destruction est mon art. Si vous avez besoin de la chaleur dévastatrice de la magie du feu, je suis votre sorcier.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[8]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Kagejin",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Ninja",
  rank: "S"
)
user.photo.attach(io: URI.open("#{array_url[9]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Le Maître des Ombres",
  price: 80,
  address: "Zatoishi, Switzerland",
  description: "Kagejin, le ninja mystérieux et agile, maître de l'art du ninjutsu. Mes mouvements sont aussi fluides que l'ombre elle-même, et mes attaques sont aussi silencieuses que le vent. Armé de mes kunai et shuriken, je suis prêt à accomplir les missions les plus périlleuses. Mon repaire se trouve dans les recoins secrets du Village Caché de l'Ombre, où seule la nuit révèle mes véritables capacités.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[9]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Brise-Crâne",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Guerrier",
  rank: "B"
)
user.photo.attach(io: URI.open("#{array_url[10]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Force brute, désolation et bottage de cul en règle",
  price: 25,
  address: "Grotte des Hurlements Sauvages",
  description: "Je suis Brise-Crâne, le troll colossal maître de la force brute et de la désolation. Ma massue écrasante fend l'air avec une puissance dévastatrice, et mes rugissements font trembler la terre. Mon repaire se trouve dans la Grotte des Hurlements Sauvages, où la brutalité règne en maître. Engagez-moi si vous avez besoin d'une montagne de force pour écraser vos ennemis et semer le chaos sur le champ de bataille.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[10]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Doge",
  email: Faker::Internet.email,
  password: Faker::Internet.password(min_length: 8),
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Ninja",
  rank: "S"
)
user.photo.attach(io: URI.open("#{array_url[11]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Wow. Such fighter. Many violence. Woof.",
  price: 42,
  address: "Les tréfonds, Internet",
  description: "Woof woof. Wif. Woof wif woof",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[11]}"), filename: "file#{user.user_name}")
offer.save!

user = User.create(
  user_name: "Loup solitaire",
  email: "woofwoof@caramail.fr",
  password: "azerty",
  last_name: Faker::Games::ElderScrolls.last_name,
  first_name: Faker::Books::TheKingkillerChronicle.creature,
  job: "Guerrier",
  rank: "A"
)
user.photo.attach(io: URI.open("#{array_url[12]}"), filename: "file#{user.rank}")
user.save!

offer = Offer.create(
  title: "Loup solitaire chaud pour de la baston",
  price: 80,
  address: "Refuge de l'Aigle Noir, Vallée des Brumes",
  description: "Je suis Loup Solitaire, le mercenaire légendaire et maître du Chemin de l'Aube. Mes techniques d'arts martiaux sont inégalées, et ma lame est celle de la justice. Seul dans la bataille, je suis le guerrier solitaire qui marche entre les ombres et la lumière. Mon refuge se trouve dans la Vallée des Brumes, où seuls ceux qui cherchent la véritable voie peuvent me trouver. Engagez-moi si vous recherchez un compagnon silencieux, un défenseur de la justice, et un maître du combat rapproché.",
  user_id: User.find_by(user_name: user.user_name).id,
  job: user.job,
  rank: user.rank
)
offer.photo.attach(io: URI.open("#{array_url[12]}"), filename: "file#{user.user_name}")
offer.save!

# reservation = Reservation.create(
#   start_date: Faker::Date.between(from: 2.days.from_now, to: 3.days.from_now),
#   end_date: Faker::Date.between(from: 4.days.from_now, to: 6.days.from_now),
#   description: "Urgent besoin de gros bras pour casser des bouches",
#   offer_id: Offer.find_by(title: "Loup solitaire chaud pour de la baston").id,
#   user_id: User.find_by(user_name: "Thrain Rocfer").id
# )
# reservation.save!

# reservation = Reservation.create(
#   start_date: Faker::Date.between(from: 2.days.from_now, to: 3.days.from_now),
#   end_date: Faker::Date.between(from: 4.days.from_now, to: 6.days.from_now),
#   description: "Get in loser, on va tuer la vilaine sorcière",
#   offer_id: Offer.find_by(title: "Paladin des Cimes à louer").id,
#   user_id: User.find_by(user_name: "Loup solitaire").id
# )
# reservation.save!

puts 'Finished!'
