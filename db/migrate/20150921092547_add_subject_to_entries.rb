class AddSubjectToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :subject, :string
  end
end
