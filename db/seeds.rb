require 'faker'

5.times do

  new_cat = Category.create(name: Faker::Commerce.department)

  5.times do
    Article.create(title: Faker::Company.bs, name: Faker::Name.name, category: new_cat, price: Faker::Number.number(2).to_i, address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}", email: Faker::Internet.email('Nancy'), body: Faker::Lorem.paragraph(rand(1..4)))
  end
end


