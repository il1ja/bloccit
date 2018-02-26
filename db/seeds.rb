require 'random_data'


50.times do

  Post.create!(

    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all


50.times do
  Comment.find_or_create_by!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

5.times do
  Post.find_or_create_by!(
    title: "The Title",
    body: "The Body"
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
