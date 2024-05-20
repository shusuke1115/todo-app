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
  validates :title, presence: true, length: { maximum: 30 }, length: {minimum:6}
  validates :content, presence: true, length: { maximum: 150 }, length: {minimum:40}
end
