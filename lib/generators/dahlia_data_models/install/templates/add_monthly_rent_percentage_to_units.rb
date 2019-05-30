class AddMonthlyRentPercentageToUnits < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :units, :monthly_rent_as_percent_of_income, :integer
  end
end