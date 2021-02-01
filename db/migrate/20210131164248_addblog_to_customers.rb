class AddblogToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :blog, foreign_key: true
  end
end
