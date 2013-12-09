ActiveAdmin.register Booking do     
  index do
    column :id
    column "User" do |sc|
      link_to sc.user.name, admin_user_path(sc.user)
    end
    column "Customer" do |sc|
      link_to sc.customer.name, admin_user_path(sc.customer)
    end
    column :state
    column :created_at
    column :updated_at
    actions
  end
  filter :state,:as => :select, :collection => proc { Booking.pluck(:state).uniq }
  filter :user, :as => :select, :collection => proc { User.all.map{|user| [user.name,user.id]} }
  filter :customer, :as => :select, :collection => proc { Customer.all.map{|user| [user.name,user.id]} }                     
  filter :created_at
  filter :updated_at

  show do 
    render :partial => 'shared/booking_show'
  end
end                                   
