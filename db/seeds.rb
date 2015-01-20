require 'faker'

5.times do
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

#create Posts
50.times do
  Post.create!(
      user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

#create Comments
100.times do
  Comment.create!(
      #user: users.sample, #not yest associated Users with comments.
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'danoliphant@mac.com',
  password: 'pewfortest'
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
