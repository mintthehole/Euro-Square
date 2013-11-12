ActiveAdmin.register SalesCallEntry do    
	scope :all, :default => true
  index do
    SalesCallEntry.column_names.each do |col|
    	column col
    end
    column "Sales Person" do |sc|
      link_to sc.user.name, admin_user_path(sc.user)
    end
    actions
  end
end