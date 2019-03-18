# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create domain
d=Domain.create(base_domain: 'http://new.local.test:3000')
if !d.errors.empty?
  p d.errors.full_messages.to_sentence
end
p d
# Create redirects
[
  "https://squareup.com/market/tacocat4u/item/all-over-shirt-lp", 
  "https://squareup.com/market/tacocat4u/item/lost-time-lp",
  "https://squareup.com/market/tacocat4u/item/nvp-lp",
  ""
].each do |link|
  r=Redirect.create({
    domain_id: d.id,
    full_url: link
  })
  if !r.errors.empty?
    puts r.errors.full_messages.to_sentence
  end
  p r
end
