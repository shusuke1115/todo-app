# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks
  validates :title, presence: true, length: { minimum: 4, maximum: 40 }
  validates :content, presence: true, length: { minimum: 10 }
end
