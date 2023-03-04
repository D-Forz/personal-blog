# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  status     :integer          default("draft"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :title, :body, presence: true
  enum status: { draft: 0, published: 1, archived: 2, deleted: 3 }
  validates :status, inclusion: { in: statuses.keys }
end
