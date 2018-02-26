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

10.times do
  Comment.find_or_create_by!(

    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
puts "#{Post.count}"
5.times do
  Post.find_or_create_by!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
puts "#{Post.count}"


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
