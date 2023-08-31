class Location < ApplicationRecord
  include Titleable

  has_and_belongs_to_many :people

  validates_presence_of :name

  before_create :titleize_name
end
