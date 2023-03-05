# == Schema Information
#
# Table name: posts
#
#  id         :uuid             not null, primary key
#  body       :text
#  image_data :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
FactoryBot.define do
  factory :post do
    title      { Faker::Lorem.sentence }
    body       { Faker::Lorem.sentences(number: rand(3..15)).join(' ') }
    created_at { Faker::Time.between(from: DateTime.now - 2.months, to: DateTime.now) }
  end
end
