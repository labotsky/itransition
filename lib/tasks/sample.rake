namespace :db do
  desc 'create data'
  task populate: :environment do
    make_categories
    make_poems
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
    Poem.create(name:name, description: description, body: body) 
  end
end