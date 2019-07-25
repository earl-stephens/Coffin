class ChangeFunerals < ActiveRecord::Migration[5.2]
  def change
    remove_column :funerals, :burial_cremation
    remove_column :funerals, :type_of_service
    add_column :funerals, :burial_cremation, :string
    add_column :funerals, :type_of_service, :string
  end
end
