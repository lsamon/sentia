class CreateJoinTableAffiliationsPeople < ActiveRecord::Migration[7.0]
  def change
    create_join_table :affiliations, :people do |t|
      t.index [:person_id, :affiliation_id]
      t.index [:affiliation_id, :person_id]
    end
  end
end
