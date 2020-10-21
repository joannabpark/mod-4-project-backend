require 'jwt'

class UsersController < ApplicationController

        def index
            @users = User.all 
            render json: @users
        end
    
        def show
            @user = User.find(params[:id])
            render json: @user
        end


        def login

            user = User.find_by(username: params[:username])
        
            if user && user.authenticate(params[:password])
                payload = {user_id: user.id}
                token = JWT.encode(payload, 'NOTES', 'HS256')
                render json: { id: user.id, token: token, username: user.username, first_name: user.first_name, last_name: user.last_name, notes: user.notes}
                    else
              render json: { error: 'Invalid username or password.'}
            end
        
        
          end
    
          def create
            @user = User.new(user_params)
            if @user.save
                render json: @user
            else 
                render json: @user.errors
            end        
        end    
    
        def update
            @user = User.find(params[:id])
            if @user.update
                render json: @user
            else    
                render json: @user.errors
            end
        end
    
        def destroy
            @user = User.find(params[:id])
            @user.destroy
            render json: { message: 'success'}
        end
    
        private
    
        def user_params
            params.require(:user).permit(:username, :first_name, :last_name, :password)
        end
    
end
