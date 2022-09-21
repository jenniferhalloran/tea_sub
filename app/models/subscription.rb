class Subscription < ApplicationRecord
  belongs_to :customer, dependent: :destroy
  belongs_to :tea, dependent: :destroy

  validates_presence_of :title, :price, :frequency, :active, :customer_id, :tea_id

  enum title: {"Tier 1" => 0, "Tier 2" => 1, "Tier 3" => 2}
  enum price: {4.99 => 0, 9.99 => 1,  14.99 => 2}
  enum frequency: {"weekly" => 0, "bi-weekly" => 1, "monthly" => 2}

end