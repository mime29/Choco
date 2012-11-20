# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

#Let s create some Roles
Role.delete_all
Role.create(:name => 'Admin')
Role.create(:name => 'Owner')

User.delete_all
u = User.create(:email => 'mikaellegoff@gmail.com', :password => '123456', :password_confirmation => '123456')
# Role.all.each { |role| u.roles << role }
u.roles << Role.find_by_name("Admin")

