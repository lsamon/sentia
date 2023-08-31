FactoryBot.define do
  factory :person do
    first_name { 'Captain' }
    last_name { 'Minion' }
    gender { 'male' }
    species { 'Human' }
    vehicle { 'Starship' }
    weapon { 'Sword' }
  end
end
