namespace :db do
  desc 'create tag'
  task tag: :environment do
    make_tags
  end
end

def make_tags
  30.times do |n|
    print '.'
    name = Faker::Product.product_name 
    Tag.create(name: name) 
  end
end