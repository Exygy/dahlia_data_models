class UpdateUnitsIncomeFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :units, :max_household_income, :annual_income_max
    rename_column :units, :bmr_annual_income_min, :annual_income_min
    rename_column :units, :bmr_monthly_income_min, :monthly_income_min
  end
end
