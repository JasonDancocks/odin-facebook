10.times do
	user = User.create(email: Faker::Internet.email(Faker::GameOfThrones.character.gsub(/\s+/, ".")), password: "password")
end