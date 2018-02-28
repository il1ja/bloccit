require 'random_data'


50.times do
  Post.create!(
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

unique_post = Post.find_or_create_by(title: "First title", body: "A body")
unique_post_2 = Post.find_or_create_by(title: "second title", body: "A second body")
unique_post_3 = Post.find_or_create_by(title: "third title", body: "A third body")
Comment.find_or_create_by(post: unique_post, body: 'special comment body')
Comment.find_or_create_by(post: unique_post_2, body: 'special comment body 2')
Comment.find_or_create_by(post: unique_post_3, body: 'special comment body 3')




puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
