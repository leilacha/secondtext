# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  Author.create(
    bio: Faker::Hipster.paragraphs,
    name: Faker::FunnyName.name
  )
end
authors = Author.all.pluck(:id)

10.times do
  Product.create(
    title: Faker::Book.title,
    description: Faker::Hipster.paragraphs, 
    release_year: rand(1984..2020),
    section_id: Section.find_by(name: 'Livres').id,
    category: %w[Romans Essais Poésie].sample,
    author_id: authors.sample
  )
end

10.times do
  Product.create(
    title: Faker::Book.title,
    description: Faker::Hipster.paragraphs,
    release_year: rand(1984..2020),
    section_id: Section.find_by(name: 'Films').id,
    category: %w[Fiction Documentaire].sample,
    author_id: authors.sample
  )
end