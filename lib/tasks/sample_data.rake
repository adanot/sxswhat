namespace :db do
  desc "Fill db with sample data"
  task populate: :environment do
	User.create!(name: "Example User",
			email: "example@gmail.com",
			password: "foobar",
			password_confirmation: "foobar")
	99.times do |n|
	  name = Faker::Name.name
	  email = "test-#{n+3}@test.com"
	  password = "password"
	  User.create!(name: name,
			email: email,
			password: password,
			password_confirmation: password)
	  end
	end
end
