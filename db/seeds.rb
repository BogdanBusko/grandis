admin = FactoryBot.create(
  :user,
  email: 'admin@email.com',
  password: '123456'
)

users = FactoryBot.create_list(:user, 10, password: '123456')
users << admin

users.each do |user|
  FactoryBot.create_list(:post, rand(1..20), user:)
end
