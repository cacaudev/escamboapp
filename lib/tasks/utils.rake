namespace :utils do
  
  desc "Rebuild Db faster on development mode"
  task rebuild_db: :environment do
    raise "Not allowed to run on production" if Rails.env.production?
    
    puts "Recreating DB..."
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['utils:generate_admins'].execute
    puts "Recreating DB...[OK]"
  end

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

end