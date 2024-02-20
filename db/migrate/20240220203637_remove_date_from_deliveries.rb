class RemoveDateFromDeliveries < ActiveRecord::Migration[7.0]
  def change
    remove_column :deliveries, :date
  end
end
