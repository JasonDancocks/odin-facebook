10.times do
	@name = Faker::GameOfThrones.character
	user = User.create(name: @name, email: Faker::Internet.email(@name.gsub(/\s+/, ".")), password: "password")
	rand(1..5).times do 
		user.posts.create(title: Faker::Overwatch.quote, body: Faker::GameOfThrones.city)
	end
end