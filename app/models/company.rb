class Company < ActiveRecord::Base
  validates_presence_of :name

  has_many :hashtags
  has_many :faqs
end
