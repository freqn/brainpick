class Person < ActiveRecord::Base
  validates :name, :specialty, :email, presence: true
end