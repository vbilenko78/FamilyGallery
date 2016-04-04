Member.create! name: 'member-1', email: 'member-1@example.com', password: 'member-1@example.com', password_confirmation: 'member-1@example.com'

Admin.create! name: "admin-1", email: 'admin-1@example.com', password: 'admin-1@example.com', password_confirmation: 'admin-1@example.com'

Gallery.create! name: "First Gallery", owner: Admin.first, description:<<-EOS
This is my first test gallery!
This is my work
EOS
