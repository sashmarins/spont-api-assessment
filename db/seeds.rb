# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# create Users
25.times do |u|
    name = Faker::Name.unique.name
    user = User.create!(name: name)
end

# Create categories
12.times do |c|
    catname = Faker::Hobby.unique.activity
    category = Category.create!(name: catname)
end

# Create Blogs
(rand(20..40)).times do |b|
    blogtitle = Faker::Verb.base
    text = Faker::Lorem.paragraph
    userid = rand(1..25)
    catid = rand(1..12)
    blog = Blog.create!(
        title: blogtitle,
        content: text,
        user_id: userid,
        category_id: catid
    )
end
