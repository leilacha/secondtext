# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Author.create(
    bio: Faker::Hipster.paragraphs,
    name: Faker::FunnyName.name
  )
end
authors = Author.all.pluck(:id)

10.times do
  Product.create(
    bio: Faker::Hipster.paragraphs,
    name: Faker::FunnyName.name,
    description: Faker::Hipster.paragraphs,
    release_date: Faker::Date.between(from: 200.years.ago, to: 1.year.ago),
    section_id: Section.find_by(name: 'Livres').id,
    category: %w[fiction non-fiction essay].sample,
    author_id: authors.sample
  )
end
