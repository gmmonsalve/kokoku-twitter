class Tweet < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { maximum: 280 }
end
