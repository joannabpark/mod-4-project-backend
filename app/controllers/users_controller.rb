class UsersController < ApplicationController

        def index
            users = User.all 
            render json: UserSerializer.new(users)
        end
    
        def show
            user = User.find(params[:id])
            render json: UserSerializer.new(user)
        end
    
        def new
            user = User.new
        end
    
        def create
            user = User.create(user_params)
            render json: UserSerializer.new(user)
        end
    
        def edit
        end
    
        def update
            user = User.find(params[:id])
            user.update(user_params)
            render json: UserSerializer.new(user)
        end
    
        def destroy
            user = User.find(params[:id])
            user.destroy
            render json: { message: 'success'}
        end
    
        private
    
        def user_params
            params.require(:user).permit(:username, :first_name, :last_name)
        end
    
end
