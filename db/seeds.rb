require 'random_data'

15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

5.times do
  User.create!(

  name:     RandomData.random_name,
  email:    RandomData.random_email,
  # password: RandomData.random_sentence
  )
end
users = User.all

50.times do
  Post.create!(
    user:   users.sample,
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

50.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
sponsoredposts = SponsoredPost.all
#
# 102.times do
#   Comment.create!(
#     post: sponsoredposts.sample,
#     body: RandomData.random_paragraph,
#   )
# end

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

50.times do
  Advertisement.create!(
    title:  RandomData.random_sentence,
    cpoy:   RandomData.random_paragraph,
    price: 1
  )
end
advertisements =  Advertisement.all

50.times do
  Question.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    resolved: false
  )
end
questions =  Question.all

unique_post = Post.find_or_create_by(title: "First title", body: "A body")
unique_post_2 = Post.find_or_create_by(title: "second title", body: "A second body")
unique_post_3 = Post.find_or_create_by(title: "third title", body: "A third body")
Comment.find_or_create_by(post: unique_post, body: 'special comment body')
Comment.find_or_create_by(post: unique_post_2, body: 'special comment body 2')
Comment.find_or_create_by(post: unique_post_3, body: 'special comment body 3')

user = User.first
user.update_attributes!(
  email: 'youremail.com', # replace this with your personal email
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsoredposts created"
puts "#{Comment.count} comments created"
