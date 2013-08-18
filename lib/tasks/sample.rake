namespace :db do
  desc 'create data'
  task populate: :environment do
    make_categories
    make_poems
    make_category_poem
    make_users
  end
end

def make_categories
  5.times do |n|
    print '.'
    name = Faker::Product.product_name 
    description = Faker::Lorem.paragraph    
    Category.create(name: name, description: description) 
  end
end

def make_poems
  30.times do |n|
    print '.'
    name = Faker::Product.product_name  
    description = Faker::Lorem.paragraph
    body = Faker::Lorem.paragraph(5)
    user_id = 1 + Random.rand(5) 
    Poem.create(name:name, description: description, body: body, user_id: user_id) 
  end
end

def make_category_poem
  print '.'  
  poems = Poem.all
  categories = Category.all
  30.times do |n|
    p = poems[1 + Random.rand(29)]
    c = categories[1 + Random.rand(4)]
    c.poems << p
  end
  puts
end

def make_users
  5.times do
    print '.'
    email = Faker::Internet.email
    password = '123456789'
    User.create(email: email, password: password, password_confirmation: password)
  end
end