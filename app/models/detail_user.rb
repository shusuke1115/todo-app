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
class DetailUser < ApplicationRecord
  enum gender: { male: 1, female: 2, other: 3 }
end
