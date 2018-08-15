class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string     :first_name
      t.string     :last_name
      t.string     :email
      t.string     :title
      t.datetime   :start_date
      t.datetime   :end_date
      t.boolean    :approved, default: false
      t.text       :description
      t.references :user, foreign_key: true
   end 
 end
end