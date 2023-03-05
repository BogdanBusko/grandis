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
class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
