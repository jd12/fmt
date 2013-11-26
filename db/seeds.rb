# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Administrator.new()
admin.name = 'Admin'
admin.email = 'admin@fmp.com'
admin.password = 'muskrat'
admin.password_confirmation = 'muskrat'
admin.save!