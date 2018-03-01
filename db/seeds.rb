require 'random_data'

15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

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



puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
