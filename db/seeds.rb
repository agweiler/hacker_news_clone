require 'faker'
adam = User.create(name: "Adam", pass: "lol")
andreas = User.create(name: "Andreas", pass: "hawhawhaw")
2.times do
  Post.create(title: (Faker::Hacker.ingverb + " " + Faker::Hacker.noun), text: (Faker::Lorem.paragraph*3), user_id: 1)
  Post.create(title: Faker::Commerce.product_name, text: (Faker::Lorem.paragraph*3), user_id: 2)
end
Comment.create(text: Faker::Lorem.paragraph, user_id: 1, post_id: 1)
Comment.create(text: Faker::Lorem.paragraph, user_id: 1, post_id: 2)
Comment.create(text: Faker::Lorem.paragraph, user_id: 2, post_id: 1)
Comment.create(text: Faker::Lorem.paragraph, user_id: 2, post_id: 2)





