# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  belongs_to :user
end
