class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged 
  attr_accessible :body, :cost, :title, :duration, :minutes, :days, :frequency, :video, :startdate, :channel
  has_many :purchases
  has_many :users, through: :purchases

  default_scope order('lessons.created_at ASC')

  def cost_in_cents
    (self.cost * 100).to_i
  end
end
