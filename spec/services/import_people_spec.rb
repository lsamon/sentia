require 'rails_helper'

RSpec.describe ImportPeople do
  let(:csv_file) { Rails.root.join('spec', 'fixtures', 'dummy.csv') }
  subject { described_class.new(csv_file) }

  it 'should only create two people out of the 3 in the file' do
    expect { subject.call }.to change { Person.count }.by(2)
  end

  it 'should only create 3 locations out of the 4 in the file' do
    expect { subject.call }.to change { Location.count }.by(3)
  end

  it 'should only create 2 affiliations out of the 4 in the file' do
    expect { subject.call }.to change { Affiliation.count }.by(2)
  end
end
