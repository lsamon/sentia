require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'create' do
    it 'add person to the database' do
      expect { create(:person) }.to change { Person.count }.by(1)
    end

    context 'when first_name is blank' do
      it 'should not create new person object' do
        expect { create(:person, first_name: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: First name can't be blank")
      end
    end

    context 'when gender is blank' do
      it 'should not create new person object' do
        expect { create(:person, gender: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Gender can't be blank")
      end
    end

    context 'when species is blank' do
      it 'should not create new person object' do
        expect { create(:person, species: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Species can't be blank")
      end
    end
  end
end
