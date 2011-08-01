# using symbol ':user' makes Factory Girl simulate the User model

Factory.define :user do |user|
  user.name                   "Donald Duck"
  user.email                  "Donald@Duck.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end
