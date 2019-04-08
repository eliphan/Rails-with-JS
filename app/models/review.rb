class Review < ApplicationRecord
    belongs_to :user
    belongs_to :book 
   

    def user_id
      self.try(:user).try(:id)
    end

    def user_id=(id)
      user = User.find_or_create_by(id: id)
      self.user = user
    end

    def user_username
      self.try(:user).try(:username)
    end
      
    def user_username=(username)
      user = User.find_or_create_by(username: username)
      self.user = user
    end
    
    def user_attributes=(user_attributes)
      if !user_attributes[:username].blank? 
        self.user = User.find_or_create_by(user_attributes)
      end 
    end

end
