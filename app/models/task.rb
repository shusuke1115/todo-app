# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text
#  limit      :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :title, presence: true, length: { minimum: 4, maximum: 40 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :limit, presence: true
end
