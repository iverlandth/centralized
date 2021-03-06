# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Church.all.to_a.present?
  Church.create(name: 'Iglesia Cristiana Yarden', address: 'Calle matos  #131 casi esquina Calle La Paz', country: 'BO', state: 'Potosí')
end


unless User.all.to_a.present?

  church_example = Church.find_by_name('Iglesia Cristiana Yarden')
  organizer = User.create(email: 'organizer@yarden.com', password: '123123123', username: 'organizer', rol: User.rols[:organizer], church: church_example)

  Member.create(first_name: 'Organizer', middle_name: 'Yarden', gender: 'm', church: church_example, date_of_birth: Time.now - 1.year, user: organizer)

end

unless AdminUser.all.to_a.present?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end