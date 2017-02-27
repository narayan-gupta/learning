class SessionsController < ApplicationController
    def new
        
        
    end 

    def create 
        user = User.find_by(email: params[:session][:email].downcase)  # Here since we are given the email, we try and find the user by their email
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Login succesful"
            redirect_to user_path(user)
            session[:user_id]  = user.id      
        else 
            flash.now[:danger] = "There something wrong with your email or password" 
            render 'new' # if the user is not authenticated we render the log in page again 
            
        end 

        
    end 
    
    def destroy
        session[:user_id] = nil
        flash[:success]= "Log Out Successful"
        redirect_to root_path
    end
end 