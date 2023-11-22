require "open-uri"
Offer.destroy_all
User.destroy_all
puts 'Creating 10 users and each user has an offer...'
array_url = ["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/882367c8-9104-494d-8a9c-62384aa16beb/dftkr9n-15698c0a-cbab-4427-bbf2-0d52d21e58ff.jpg/v1/fill/w_894,h_894,q_70,strp/dnd_character_profile__2_by_hypnoman172feb_dftkr9n-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAyNCIsInBhdGgiOiJcL2ZcLzg4MjM2N2M4LTkxMDQtNDk0ZC04YTljLTYyMzg0YWExNmJlYlwvZGZ0a3I5bi0xNTY5OGMwYS1jYmFiLTQ0MjctYmJmMi0wZDUyZDIxZTU4ZmYuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.WtRIuMnKQdyjlf-o2oLUr2wph9qLplT2ETIKqI6uXvM", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/842c4406-8fa0-436e-89c7-54c953cc20df/d9jn27d-92afe804-3d1b-42c3-ac17-f43a01d13c5e.jpg/v1/fill/w_510,h_700,q_70,strp/ellar_by_in2eternity_d9jn27d-350t-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9ODAwIiwicGF0aCI6IlwvZlwvODQyYzQ0MDYtOGZhMC00MzZlLTg5YzctNTRjOTUzY2MyMGRmXC9kOWpuMjdkLTkyYWZlODA0LTNkMWItNDJjMy1hYzE3LWY0M2EwMWQxM2M1ZS5qcGciLCJ3aWR0aCI6Ijw9NTgzIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.rnSGKI_JyK02EPjkQ0BnZyDZCDLKf4Ejyy47Tu8cxzY", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e7c0a025-979c-49ff-8b3e-5b458791817c/degfqi0-3b2d010c-9a0c-46c9-9636-b2fcf5e78df8.jpg/v1/crop/w_474,h_700,x_0,y_0,scl_0.59748427672956,q_70,strp/tiefling_by_eluari_degfqi0-350t-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTE3MyIsInBhdGgiOiJcL2ZcL2U3YzBhMDI1LTk3OWMtNDlmZi04YjNlLTViNDU4NzkxODE3Y1wvZGVnZnFpMC0zYjJkMDEwYy05YTBjLTQ2YzktOTYzNi1iMmZjZjVlNzhkZjguanBnIiwid2lkdGgiOiI8PTc5NSJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.H77NGtefn5L6M0AHc1bLqTp59_sbzxU3LzlNp5huFKE", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a74dcaec-badd-48b0-8cf3-688358ffd2f7/detbahx-699e9dcd-907d-4be9-8eb4-451bafa32fad.jpg/v1/fit/w_600,h_1146,q_70,strp/_commission__satyr_bard_portreit_by_miradella_detbahx-300w-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTE0NiIsInBhdGgiOiJcL2ZcL2E3NGRjYWVjLWJhZGQtNDhiMC04Y2YzLTY4ODM1OGZmZDJmN1wvZGV0YmFoeC02OTllOWRjZC05MDdkLTRiZTktOGViNC00NTFiYWZhMzJmYWQuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.xZ87B7nYeixYfww00KoxcxJi-jlMX0XgRE32RAzObiI", "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/8b92c598-a4c8-46f6-a45d-584bc5406523/de72clx-fa9b3146-2d12-45e6-a0a3-16150db87065.jpg/v1/crop/w_497,h_700,x_0,y_0,scl_0.57439446366782,q_70,strp/blue_knight_by_artofty_de72clx-350t-2x.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTIyMCIsInBhdGgiOiJcL2ZcLzhiOTJjNTk4LWE0YzgtNDZmNi1hNDVkLTU4NGJjNTQwNjUyM1wvZGU3MmNseC1mYTliMzE0Ni0yZDEyLTQ1ZTYtYTBhMy0xNjE1MGRiODcwNjUuanBnIiwid2lkdGgiOiI8PTg2NyJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.raXabOolz4L_7YH7nQvJCSpMh129NsKmzf1Jbjqgwn4", "https://cdnb.artstation.com/p/assets/images/images/026/396/809/large/george-kanino-mantiri-poto-propil.jpg?1588677846", "https://cdna.artstation.com/p/assets/images/images/009/202/780/large/lionel-dorviler-speed-chara-4-wip7-final.jpg?1517672511", "https://cdnb.artstation.com/p/assets/images/images/068/344/801/smaller_square/yves-narbonne-morthas-web-srgb.jpg?1697576921", "https://t3.ftcdn.net/jpg/06/39/97/92/240_F_639979218_bGnPnPDOuQLlFASUurE7RYiS0RaN6Zmc.jpg", "https://t4.ftcdn.net/jpg/05/71/19/33/240_F_571193377_obyyXxhLDYlOOPWhi2GOS5WGgzM4UiFx.jpg", "https://t4.ftcdn.net/jpg/04/53/45/51/240_F_453455169_d7HJ6DFNRM10bn1eNhgLTv08Zzhylbbf.jpg", "https://cdnb.artstation.com/p/assets/images/images/028/704/657/20210806120944/smaller_square/cxyssalis-jacob-yuean-tpose-2-d.jpg?1628269784", "https://cdna.artstation.com/p/assets/covers/images/042/717/998/20211026113531/smaller_square/lisian-mennella-lisian-mennella-bulette-1.jpg?1635266132", "https://cdnb.artstation.com/p/assets/images/images/024/728/627/20200304111138/smaller_square/lisian-mennella-goblin1-1.jpg?1583341898", "https://t4.ftcdn.net/jpg/06/66/87/39/240_F_666873904_uwI2DL6N3wUI8ITFWddwXH9XcDmFgxlr.jpg", "https://t4.ftcdn.net/jpg/05/89/15/41/240_F_589154176_5NBpvU7vf2usbcmIYkt7bSZnHao0p02g.jpg", "https://as2.ftcdn.net/v2/jpg/05/89/15/41/1000_F_589154156_ohBYQrjmRx9fwAXtG6hcV7mQ4j1BOqI7.jpg", "https://as2.ftcdn.net/v2/jpg/05/89/15/41/1000_F_589154188_4DsjxEiwfV0zJR2hZlYUJ5DaztxooKVW.jpg", "https://as2.ftcdn.net/v2/jpg/05/89/15/41/1000_F_589154175_cuVG9ZHFH2QpHbBay8RFXkt46hc2wHOV.jpg", "https://cdnb.artstation.com/p/assets/images/images/005/960/555/large/sebastien-le-divenah-troll2.jpg?1495015441"]
compteur = 0

10.times do
  image_url = array_url[compteur]
  user = User.new(
    user_name: Faker::Books::TheKingkillerChronicle.character,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    last_name: Faker::Games::ElderScrolls.last_name,
    first_name: Faker::Books::TheKingkillerChronicle.creature
  )
  user.save!
  offer = Offer.new(
    title: Faker::Fantasy::Tolkien.poem,
    description: Faker::Books::Lovecraft.paragraph(sentence_count: 10),
    price: Faker::Number.between(from: 50, to: 200),
    address: Faker::Books::Dune.planet,
    user_id: user.id
  )
  offer.photo.attach(io: URI.open("#{image_url}"), filename: "file#{compteur}")
  offer.save!
  compteur += 1
end
puts 'Finished!'

# Faker::Games::WorldOfWarcraft.class_name
