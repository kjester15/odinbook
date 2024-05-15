# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.create = ([username: "user1", email: "user1@email.com", password: "user1pw"])
# User.create = ([username: "user2", email: "user2@email.com", password: "user2pw"])
# User.create = ([username: "user3", email: "user3@email.com", password: "user3pw"])
# User.create = ([username: "user4", email: "user4@email.com", password: "user4pw"])
# User.create = ([username: "user5", email: "user5@email.com", password: "user5pw"])

5.times do |i|
  User.create([username: "user#{i}", email: "user#{i}@email.com", password: "user#{i}pw"])
end