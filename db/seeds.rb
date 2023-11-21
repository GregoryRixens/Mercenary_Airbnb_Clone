puts 'Creating 10 fake offers...'
10.times do
  offer = Offer.new(
    title: Faker::Fantasy::Tolkien.poem,
    description: Faker::Books::Lovecraft.paragraphs(number: 2),
    # poster_url: Faker::LoremFlickr.image(search_terms: ['cat']),
    price: Faker::Number.between(from: 50, to: 200),
    address: Faker::Books::Dune.planet,
  )
end
puts 'Finished!'

puts 'Creating 10 users...'
10.times do
  user = User.new(
    user_name: Faker::Games::WorldOfWarcraft.hero,
    email: Faker::Internet.email,
    # to test = email: Faker::Internet.email(name: :user_name)
    # poster_url: Faker::LoremFlickr.image(search_terms: ['cat']),
    last_name: Faker::Games::ElderScrolls.last_name,
    first_name: Faker::Books::TheKingkillerChronicle.character,
  )
end
puts 'Finished!'

# Faker::Games::WorldOfWarcraft.class_name
