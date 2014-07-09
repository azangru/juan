# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


t1 = Translation.create!(
  name: "English original",
  title: "Don Juan",
  language: "English",
  author: "George Byron",
)

t2 = Translation.create!(
  name: "Russian translation by Tatiana Gnedich",
  title: "Дон Жуан",
  language: "Russian",
  author: "Татьяна Гнедич",
)

t3 = Translation.create!(
  name: "Russian translation by Georgy Shengeli",
  title: "Дон-Жуан",
  language: "Russian",
  author: "Георгий Шенгели",
)