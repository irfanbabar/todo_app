class ChangeColumnApprovedAppointments < ActiveRecord::Migration[5.2]
  def up
  	change_column_default :appointments, :approved, nil
  end

  def down
  	change_column_default :appointments, :approved, false
  end
end
