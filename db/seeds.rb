# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

#Let s create some Roles

aRole = Role.create(:name => 'Admin')
Role.create(:name => 'Owner')

# User.create(:email => 'mikaellegoff@gmail.com', :password => '123', :password_confirmation => '123', :role => aRole)
