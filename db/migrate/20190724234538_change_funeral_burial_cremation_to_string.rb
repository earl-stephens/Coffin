class ChangeFuneralBurialCremationToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :burial_cremation, :integer
    remove_column :type_of_service, :integer
    add_column :burial_cremation, :string
    add_column :type_of_service, :string
  end
end
