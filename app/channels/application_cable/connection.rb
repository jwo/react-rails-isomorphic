module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user


    def allow_request_origin?
      true
    end
    
    def connect
      #self.current_user = find_verified_user
      self.current_user = User.first # for now
    end

    protected
      def find_verified_user
        if current_user == User.find(cookies.signed[:user_id])
          current_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
