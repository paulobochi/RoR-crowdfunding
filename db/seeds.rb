# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Category.first.blank?
  categories = Category.create([{name: 'Tech'}, {name: 'Film'}, {name: 'Community'},
    {name: 'Music'}, {name: 'Education'}, {name: 'Gaming'}])
end
