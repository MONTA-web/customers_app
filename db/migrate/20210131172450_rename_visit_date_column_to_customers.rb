class RenameVisitDateColumnToCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :visit_date, :start_time
  end
end
