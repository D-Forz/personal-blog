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
FactoryBot.define do
  factory :post do
    title { "Title" }
    body { "This is a description for a Post" }
    status { :draft }

    trait :invalid do
      title { nil }
    end
  end
end
