namespace :admins do
  desc "Task for creating random admin"
  task :create, [:email] => :environment do |t, args|
    email = args[:email].present? ? args[:email] : 'standard_admin@test.com'

    password = SecureRandom.uuid.slice(0,6)
    admin_params = { email: email, name: 'John Dow', password: password, role: :admin }
    admin = User.create(admin_params)
    puts "Created Admin with email #{admin_params[:email]} with password #{admin_params[:password]}"
  end
end

