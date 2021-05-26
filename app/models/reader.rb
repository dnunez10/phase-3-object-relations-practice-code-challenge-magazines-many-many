class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader: self, magazine: magazine, price: price)
  end

  def total_subscription_price
    # self.subscriptions.sum{|s| s.price}
    self.subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)
    s = self.subscriptions.find_by(magazine: magazine)
    s.destroy
  end
end