namespace :user do
  
  desc "import user from db/users.csv"
  task :import => :environment do
	filename = "db/users.csv"
  require 'csv'
	CSV.foreach(filename, { :col_sep => ";", :skip_blanks => true }) do |row|
    	p row
    	u = User.new(
			:first_name => row[0],
			:email => row[1],
			:password => SecureRandom.hex(8),
      :imported => true
		)
		u.save!(:validate => false)
    end
  end

  desc "remove all imported users"
  task :reset => :environment do
    User.where(:imported => true).destroy_all
  end

end
