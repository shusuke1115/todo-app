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
#  image_id   :string
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
  attachment :image
  validates :title, presence: true, length: { minimum: 4, maximum: 40 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :limit, presence: true

  def rest_time
    # taskの締め切り日を取得
    deadline = self.limit

    # 今日の日付を取得
    now = Date.today

    # taskの締め切り日から今日の日付を引いて、残り日数を計算
    rest_days = (deadline - now).to_i

    # 残り日数が1年以上ある場合
    if rest_days >= 365
      years = rest_days / 365
      remaining_days = rest_days % 365
      return "あと#{years}年と#{remaining_days}日"
    elsif 1 < rest_days && rest_days < 365
      return "あと#{rest_days}日"
    elsif rest_days == 1
      return "<span style='color:red;'>今日までだよ！</span>".html_safe
    else
      return "<span style='color:red;'>もう過ぎてる！</span>".html_safe
    end
  end
end
