class Appointment <  ApplicationRecord 
 belongs_to :user, optional: true

 validates :first_name, presence: { message: "" }
 validates :last_name, presence:  { message: "" }
 validates :email, presence: true
 validates :title, presence: true
 validates :start_date, presence: true
 validates :end_date, presence: true
 validates :description, presence: true


 
# validates :first_name, presence: {massege: 'Must be filld' }  

end
# Appointment.create(first_name: nil).valid? # => false
