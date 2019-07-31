require "byebug"

class UsersController < ApplicationController

   def index
      users = User.all
      render json: users
   end

   def show
      token = request.headers["Authentication"].split(" ")[1]
      payload = decode(token)
      user = User.find(payload["user_id"])
      if user
         render json: user, status: :accepted
      else
         render json: {message: "Error", authenticated: false}
      end
   end

   def create        
      user = User.new(user_params)
      if user.valid?
         user.save!
         render json: user
      else 
         user.destroy
         render json: {message: "Please enter a unique Username!"}
      end  
   end

   private

   def user_params
      params.require(:user).permit(:username, :password)
   end
   def default
   {
      :include => {
         :games => { 
            :except => [:created_at, :updated_at]
            }
         }, :except => [:created_at, :updated_at]
      }        
   end

end


# class UsersController < ApplicationController
#    def index
#       users = User.all
#       render json: users
#    end

#    def show            
#       token = request.headers["Authentication"].split(" ")[1]
#       payload = decode(token)
#       user = User.find(payload["user_id"])
#       if user
#          render json: user, status: :accepted
#       else
#          render json: {message: "Error", authenticated: false}
#       end      
#    end
 
#    def create        
#       user = User.new(user_params)
#       if user.valid?
#          user.save!
#          render json: user
#       else 
#          user.destroy
#          render json: {message: "Please enter a unique Username!"}
#       end  
#    end
     
#    private

#    def user_params
#       params.require(:user).permit(:username, :password)
#    end

#    def default
#    {
#       :include => {
#          :games => { 
#             :except => [:created_at, :updated_at]
#             }
#          }, :except => [:created_at, :updated_at]
#       }        
#    end
# end
