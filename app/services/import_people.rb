require 'csv'

# Import people details
class ImportPeople
  attr_reader :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
  end

  def call
    results = test_import
    Person.create!(results.people) if results.success?
    results
  end

  private

  def test_import
    errors = []
    people = []

    CSV.foreach(csv_file, headers: true) do |row|
      row_h = row.to_h
      locations_attributes = locations_details(row_h)

      if row_h['Affiliations'].present?
        affiliations_attributes = affiliations_details(row_h)

        person_attributes = person_details(row_h)
        person_attributes.merge!(
          locations_attributes: locations_attributes,
          affiliations_attributes: affiliations_attributes
        )

        person = Person.new(person_attributes)
        people << person_attributes
    
        errors << person.errors.full_messages.to_sentence unless person.valid?
      end
    end

    OpenStruct.new(success?: errors.empty?, people: people, errors: errors)
  end

  def person_details(row)
    {
      first_name: row['Name'].split(' ')[0]&.squish,
      last_name: row['Name'].split(' ')[1]&.squish,
      gender: row['Gender'].downcase,
      species: row['Species'],
      vehicle: row['Vehicle'],
      weapon: row['Weapon']
    }
  end

  def locations_details(row)
    row['Location'].split(',').map do |location|
      { name: location&.squish }
    end
  end

  def affiliations_details(row)
    row['Affiliations'].split(',').map do |affiliation|
      { name: affiliation&.squish }
    end
  end
end
