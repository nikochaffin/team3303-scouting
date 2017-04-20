# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usernames = [
  "peter",
  "josh",
  "nick",
  "anthony",
  "kayley",
  "kelton",
  "madsen",
  "john",
  "grady",
  "jonah",
  "zeke",
  "mark",
  "ben",
  "abigail",
  "nanette",
  "gregfiske",
]
admin_users = [
  {
    username: "admin",
    password: "password",
    password_confirmation: "password"
  },
  {
    username: "morgan",
    password: "password",
    password_confirmation: "password"
  },
  {
    username: "caleb",
    password: "securepassword",
    password_confirmation: "securepassword"
  },
  {
    username: "mitch",
    password: "adminpassword",
    password_confirmation: "adminpassword"
  },
  {
    username: "jameson",
    password: "password",
    password_confirmation: "password"
  },
  {
    username: "carlson",
    password: "password",
    password_confirmation: "password"
  }
]

usernames.each do |username|
  User.create(username: username, password: "", password_confirmation: "")
end

admin_users.each do |user|
  User.create(username: user[:username], password: user[:password], password_confirmation: user[:password])
end

Game.create(name: "Stronghold", year: 2016)
