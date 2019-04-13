class User < ApplicationRecord
  validates_presence_of :email

  has_many :purchases
  has_many :libraries
  has_many :library_contents, through: :libraries
  has_many :active_contents, -> { where('libraries.validity_expires_on >= ?', Date.today) }, through: :libraries, source: :library_contents
end
