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
#
require "test_helper"

class DetailUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
