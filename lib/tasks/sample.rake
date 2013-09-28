namespace :db do
  desc 'create data'
  task populate: :environment do
    make_users
    make_categories
    make_poems
    make_category_poem
    make_paragraphs    
    make_tags
  end
end

def make_users
  password = '123456789'
  5.times do
    email = Faker::Internet.email
    user = User.create(email: email, password: password, password_confirmation: password, role: 'banned')
    user.confirm!
  end
  user = User.create(email: 'sergey1993.08@mail.ru', password: password, password_confirmation: password, role:'admin')
  user.confirm!
end

def make_categories
  5.times do |n|
    name = Faker::Product.product_name 
    description = Faker::Lorem.paragraph(3)    
    Category.create(name: name, description: description) 
  end
end

def make_poems
  users = User.all
  30.times do |n|
    name = Faker::Product.product_name  
    description = Faker::Lorem.paragraph(3)
    body = Faker::Lorem.paragraph(5)
    users.sample.poems.create(name:name, description: description, body: body)
  end
  10.times do |n|
    name = Faker::Product.product_name  
    description = Faker::Lorem.paragraph(3)
    body = Faker::Lorem.paragraph(5)
    users.last.poems.create(name:name, description: description, body: body)
  end
end

def make_category_poem
  poems = Poem.all
  categories = Category.all
  30.times do |n|
    p = poems[Random.rand(40)]
    c = categories[Random.rand(5)]
    c.poems << p
  end
end

def make_paragraphs
  poems = Poem.all
  50.times do |n|
    name = Faker::Product.product_name
    body = Faker::Lorem.paragraph(50)
    poems.sample.paragraphs.create(name: name, body: body)
  end  
end


def make_tags
  30.times do |n|
    name = Faker::Product.product_name 
    Tag.create(name: name) 
  end
end