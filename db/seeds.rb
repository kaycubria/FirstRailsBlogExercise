# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

3.times do
  User.create( name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password )
end

n = 0
15.times do
  n +=1
  User.all.sample.posts.create( title: "Blog Post #{n}", subhead: Faker::Lorem.sentence, content: Faker::Lorem.paragraph )
end


