# == Schema Information
#
# Table name: detail_users
#
#  id         :bigint           not null, primary key
#  age        :integer
#  birthday   :date
#  gender     :integer
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_detail_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class DetailUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
