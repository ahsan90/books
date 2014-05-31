class Lesson < ActiveRecord::Base
  attr_accessible :body, :cost, :title, :duration, :minutes, :days, :frequency, :video, :startdate, :channel
  has_many :purchases
  has_many :users, through: :purchases

  default_scope order('lessons.created_at DESC')

  def cost_in_cents
    self.cost * 100
  end
end
