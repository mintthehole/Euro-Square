ActiveAdmin.register SalesCallEnquiry do    
	scope :all, :default => true
  index do
    SalesCallEnquiry.column_names.each do |col|
    	column col
    end
    column "Sales Person" do |sc|
      link_to sc.user.name, admin_user_path(sc.user)
    end
    actions
  end

  csv do
    column :date
    column("Sales Person") {|sc| sc.user.name }
    column :shipper_name
    column :pic
    column :mode
    column :volume_idea
    column :pol
    column :pod
    column :cargo
    column :rate_indication
    column :shipment_date
    column :possibility_to_secure
    column :competitor
    column :special_instruction
  end
end



