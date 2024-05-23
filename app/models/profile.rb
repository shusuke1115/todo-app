# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  age        :integer
#  birthday   :date
#  gender     :integer
#  nickname   :string
#  user_image :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  enum gender: { male: 0, female: 1, other: 2 }, _prefix: true
  belongs_to :user
  has_one_attached :user_image
  # validates :gender, inclusion: { in: [0, 2, 3], message: "%{value} is not a valid gender" }
  validates :nickname, presence: true,length: { maximum: 20 }
  validates :gender, presence: true
  validates :birthday, presence: true



end
