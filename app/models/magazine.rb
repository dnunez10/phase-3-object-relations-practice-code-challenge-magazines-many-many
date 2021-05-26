class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    self.readers.map{|r| r.email}.join(";")
  end

  def self.most_popular
    self.all.max{|a, b| a.subscriptions.length <=> b.subscriptions.length}
  end
end