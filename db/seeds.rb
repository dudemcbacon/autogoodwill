# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.email = 'gentoolicious@gmail.com'
user.password = 'butthat1'
user.password_confirmation = 'butthat1'
user.settings(:dashboard).saved_searches = ['amiga']
user.settings(:dashboard).gw_user = 'brandonburnett'
user.settings(:dashboard).gw_pass = 'butthat1'
user.save!
