class Subscription < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  belongs_to :tea, dependent: :destroy

  validates_presence_of :title, :price, :frequency, :active, :customer_id, :tea_id
end