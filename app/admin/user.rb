ActiveAdmin.register User do     
  index do                            
    column :email         
    column :name
    column :user_role            
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :name
      f.input :user_role, :as => :select, :collection => (User::ROLES.map {|a| a.to_s})
      f.input :password  
      f.input :password_confirmation  
    end                               
    f.actions                         
  end    

end