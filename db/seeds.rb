# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraph
  tags_attributes = []

  for i in 0..rand(1..4)
    tags_attributes << { title: Faker::Lorem.word }
  end

  Note.create(title: title,
              body: body,
              tags_attributes: tags_attributes
  )
end
