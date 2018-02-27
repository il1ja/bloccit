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

Post.find_or_create_by(title: "First title", body: "A body")
Post.find_or_create_by(title: "second title", body: "A second body")
Post.find_or_create_by(title: "third title", body: "A third body")


# 10.times do
#   Comment.find_or_create_by!(
#
#     post: posts.sample,
#     body: RandomData.random_paragraph
#   )
# end
# puts "#{Post.count}"
# 5.times do
#   Post.find_or_create_by!(
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph
#   )
# end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
