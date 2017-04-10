class AddColumnToTemplate < ActiveRecord::Migration[5.0]
  def change
    add_column :templates, :slugged, :string
  end
end
