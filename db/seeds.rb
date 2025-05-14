User.create!(
  email: 'admin@example.com',
  full_name: 'Admin User',
  password: 'password',
  password_confirmation: 'password',
  role: :admin
)

User.create!(
  email: 'creator@example.com',
  full_name: 'Content Creator',
  password: 'password',
  password_confirmation: 'password',
  role: :creator
)

User.create!(
  email: 'customer@example.com',
  full_name: 'Customer One',
  password: 'password',
  password_confirmation: 'password',
  role: :customer
)
