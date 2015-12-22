# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Creating & seeding Clients
clients = [
  Client.new(first_name: "Bruce", last_name: "Wayne", dni:"10000000" , birthdate: Date.new(1980,10,15), gender: "male", cui: "10-10000000-1"),
  Client.new(first_name: "Luke", last_name: "Skywalker", dni:"20000000" , birthdate: Date.new(1971,11,20), gender: "male", cui: "10-20000000-1"),
  Client.new(first_name: "Don", last_name: "Corleone", dni:"30000000" , birthdate: Date.new(1950,1,10), gender: "male", cui: "10-30000000-1"),
  Client.new(first_name: "Gandalf", last_name: "The Grey", dni:"40000000" , birthdate: Date.new(2300,9,1), gender: "male", cui: "10-40000000-1"),
  Client.new(first_name: "Stanley", last_name: "Kubric", dni:"50000000" , birthdate: Date.new(1944,3,7), gender: "male", cui: "10-50000000-1"),
  Client.new(first_name: "Lara", last_name: "Croft", dni:"60000000" , birthdate: Date.new(1978,5,7), gender: "female", cui: "10-60000000-1")
]
clients.each {| c | c.save }


# Creating & seeding Contacts
contact_info = [
  "phone" , "+54 221 461 4116",
  "phone" , "+54 221 422 8111",
  "phone" , "+54 221 539 1888",
  "phone" , "+54 221 666 2116",
  "phone" , "+54 221 532 2111",
  "mail" , "name1@domain1.com",
  "mail" , "name2@domain1.com",
  "mail" , "name1@domain2.com",
  "mail" , "name2@domain2.com",
  "mail" , "name3@domain2.com",
  "skype" , "username1",
  "skype" , "username2",
  "skype" , "username3",
  "skype" , "username4",
  "skype" , "username5",
  "address" , "address location 1",
  "address" , "address location 2",
  "address" , "address location 3",
  "address" , "address location 4",
  "address" , "address location 5"
]
contact_info.each_slice(2) do | data |
  Contact.create(
    client: Client.all.sample,
    medium: data[0],
    value: data[1]
  )
end

# Creating & seeding People
people = [
  Person.new(name: "Marlon Brando", cui: "20-11111111-1"),
  Person.new(name: "Louis CK", cui: "20-21111111-1"),
  Person.new(name: "George Carlin", cui: "20-61111111-1"),
  Person.new(name: "Chuck Norris", cui: "77-77777777-7"),
  Person.new(name: "George Lucas", cui: "20-81111111-1"),
  Person.new(name: "John Williams", cui: "20-91111111-1"),
  Person.new(name: "Carrefour", cui: "20-31111111-2"),
  Person.new(name: "WayneCorp", cui: "20-41111111-2"),
  Person.new(name: "StarkCorp", cui: "20-51111111-2")
]
people.each {| p | p.save }


# Creating Bills
bills = [
  Bill.new(description:"A mountain of cocain", amount: 50000.99, emission_date: Date.new(2015,10,22)),
  Bill.new(description:"A Batmobile", amount: 9000000.99, emission_date: Date.new(2010,1,20)),
  Bill.new(description:"200 Batarangs", amount: 50000.50, emission_date: Date.new(2013,1,20)),
  Bill.new(description:"250 Beretta ammo clips", amount: 5000.50, emission_date: Date.new(2010,1,20)),
  Bill.new(description:"Space Rocket", amount: 9000.50, emission_date: Date.new(1999,1,20)),
  Bill.new(description:"Movie Set Equipment", amount: 9000.50, emission_date: Date.new(1999,1,20))
]
bills.each do | b |
  b.client = Client.all.sample
  b.person = Person.all.sample
  b.save
end

#Massive Billing
random_descriptions = [
  'Random',
  'R4nd0m',
  'randoM'.reverse,
  'RANNNDOMMM!!',
  'randoms',
  'aleatorio'
]
100.times do
  Bill.create(
    client: Client.all.sample,
    person: Person.all.sample,
    description: random_descriptions.sample,
    amount: rand(1.00..1000000.00),
    emission_date: rand((Date.current - 10.years)..(Date.current))
  )
end
