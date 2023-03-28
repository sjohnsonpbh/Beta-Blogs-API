(0..10).each do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name:  Faker::Name.last_name, phone: "1", password: "password", username:  Faker::Internet.username)
end

# creating a list of categories
Category.create(name: "Javascript")
Category.create(name: "HTML")
Category.create(name: "CSS")
Category.create(name: "Ruby on Rails")
Category.create(name: "Angular")

# create blogs
# -a category
#  a user
#  blog info

(0..100).each do |i|
  faker_title = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize 
  fake_sub_title = Faker::Lorem.sentence 
  num_paragraphs = rand(1..5)
  paragraphs = ''
  num_paragraphs.times do 
    paragraphs += Faker::Lorem.paragraph(sentence_count: 3) + "\n\n"
  end

  blog = Blog.new(user_id: rand(0..9), title: faker_title, sub_title: fake_sub_title, content: paragraphs, image_path: "https://cdn.pixabay.com/photo/2015/05/31/10/55/man-791049_960_720.jpg")

  blog.categories = Category.all.sample(rand(0..6))
  blog.save 
end
