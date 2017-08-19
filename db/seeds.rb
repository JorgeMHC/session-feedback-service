# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
RATINGS = [
  {rate: 1, feedback: 'Horrible'},
  {rate: 2, feedback: 'Not that bad'},
  {rate: 3, feedback: 'Acceptable'},
  {rate: 4, feedback: 'Good'},
  {rate: 5, feedback: 'Excelent'}
]

(1..15).each do |index|
  session = Session.create(name: '#{number_to_human(index)} session')
  user = User.create(first_name: 'User-#{index}')

  rand_num = rand(5) + 1
  feed = RATINGS.select { |rating| rating[:rate] == rand_num}.first

  Feedback.create(rating: feed[:rate], comment: feed[:feedback], user: user, session: session)
end
