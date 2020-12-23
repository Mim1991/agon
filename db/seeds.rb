# 10.times do |index|
#     user = User.create(
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         email: "test#{index}@test.com",
#         password: "123456"
#     )
#     puts "Created User #{index}"
# end
# puts "Users created"
Course.destroy_all
puts "deleted all the courses"
10.times do |index|
  course = Course.create(
      name: ["Horton Country Park", "Pinehurst Golf Course", "Surrey National", "Westerham Golf Course", "The Addington", "Blechingley Golf Course"].sample,
      address: Faker::Address.street_address,
  )
  puts "Created course #{index}. #{course.name}"
end
puts "Courses created"
  