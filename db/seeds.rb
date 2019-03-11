# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

csv_answer = CSV.read('app/assets/form_answer.csv', headers: true)

csv_answer.each do |data|
  user = EntryUser.find_or_initialize_by(name: "#{data['参加キャラクター名']}")
  if user.new_record?
    user.save!

  end
end
