require 'jwt'

class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :password, :first_name, :last_name]

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
                token = JWT.encode(payload, 'my$ecretK3y', 'HS256')
                render json: { user: user, token: token }
                    else
              render json: { error: 'Invalid username or password.'}
            end
          end

          def current_session
            token = request.headers[:Authorization].split(' ')[1]
            decoded_token = JWT.decode(token, 'my$ecretK3y', true, { algorithm: 'HS256' })

            user_id = decoded_token[0]['user_id']

            user = User.find(user_id)

            render json: { user: user }
          end
    
        def create
            @user = User.create(user_params)
                if @user.valid?
                    payload = { id: @user.id}
                    token = JWT.encode(payload, 'my$ecretK3y', 'HS256')
                    render json: { id: @user.id, username: @user.username, token: token }
                else
                    render json: { error: 'failed to create user' }, status: :not_acceptable
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
