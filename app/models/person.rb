class Person < ApplicationRecord
  paginates_per 10

  def self.sortable_name(direction)
    results = all.sort_by { |person| person.name }
    results.reverse! if direction == :desc
    results
  end

  def self.sort_column(field, direction: 'asc')
    order("#{field}" => direction)
  end

  has_and_belongs_to_many :locations, dependent: :destroy
  has_and_belongs_to_many :affiliations, dependent: :destroy
  
  validates_presence_of :first_name, :species, :gender

  before_save :titleize_name
  before_save :update_gender

  accepts_nested_attributes_for :locations, :affiliations

  def titleize_name
    self.first_name = first_name.titleize if first_name_changed?
    self.last_name = last_name.titleize if last_name_changed?
  end

  def name
    "#{first_name} #{last_name}".squish
  end

  def update_gender
    return unless gender_changed?

    self.gender =
      if gender.starts_with?('m')
        'Male'
      elsif gender.starts_with?('f')
        'Female'
      else
        'Other'
      end
  end
end
