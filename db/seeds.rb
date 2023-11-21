puts 'Creating 10 users and each user has an offer...'
10.times do
  user = User.new(
    user_name: Faker::Games::WorldOfWarcraft.hero,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    # to test = email: Faker::Internet.email(name: :user_name)
    # poster_url: Faker::LoremFlickr.image(search_terms: ['cat']),
    last_name: Faker::Games::ElderScrolls.last_name,
    first_name: Faker::Books::TheKingkillerChronicle.character
  )
  user.save!
  offer = Offer.new(
    title: Faker::Fantasy::Tolkien.poem,
    description: Faker::Books::Lovecraft.paragraph(sentence_count: 10),
    # poster_url: Faker::LoremFlickr.image(search_terms: ['cat']),
    price: Faker::Number.between(from: 50, to: 200),
    address: Faker::Books::Dune.planet,
    user_id: user.id
  )
  offer.save!
end
puts 'Finished!'

# Faker::Games::WorldOfWarcraft.class_name

puts "tralala"
