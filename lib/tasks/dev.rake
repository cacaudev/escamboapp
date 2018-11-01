namespace :dev do
  
  desc "Setup Development"
  task setup: :environment do
    raise "Not allowed to run on production" if Rails.env.production?
    images_path = Rails.root.join('public','system')
    
    puts "Setup development..."
    Rake::Task['db:drop'].execute
    puts "Deleting images from paperclip folder...#{%x(rm -rf #{images_path})}" 
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:generate_admins'].execute
    Rake::Task['dev:generate_members'].execute
    Rake::Task['dev:generate_ads'].execute
    puts "Setup development...[OK]"
  end
  ######################################################################
  desc "Add fake admins"
  task generate_admins: :environment do
    puts "Registering fake Admins..."
    10.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456",
        role: [0,0,1,1,1].sample
      )
    end
    puts "Registering fake Admins ...[OK]"
  end
  
  ######################################################################
  desc "Add fake members"
  task generate_members: :environment do
    puts "Registering fake Members..."
    100.times do
      Member.create!(
        email: Faker::Internet.email,
        password: "123456",
        password_confirmation: "123456"
      )
    end
    puts "Registering fake Members ...[OK]"
  end
  
  ######################################################################
  desc "Add fake ads"
  task generate_ads: :environment do
    
    puts "Registering fake ads for default member..."
    # Add 5 ads for default member for testing purpose
    5.times do
      Ad.create!(
        title: Faker::Commerce.product_name,
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(200)}.#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates',
          'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end
    
    puts "Registering fake ads for default member...[OK]"
    
    puts "Registering fake ads..."
    10.times do
      Ad.create!(
        title: Faker::Commerce.product_name,
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(200)}.#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates',
          'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end
    puts "Registering fake ads...[OK]"
  end

end
