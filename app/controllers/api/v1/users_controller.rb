module Api
    module V1
        class UsersController < ApplicationController

            # register a user
            def create
                # check if the user already exists
                if User.exists?(email: params[:email])
                    render json: {
                        status: 'warning',
                        message: 'User already exists',
                    },
                    status: :unprocessable_entity
                else
                    # create a new user object and save it to the database
                    user = User.new(user_params)
                    if user.save
                        # generate token for the user
                        token = encode_token({user_id: user.id, firstname: user.firstname, lastname: user.lastname, email: user.email})
                        render json: {
                            status: 'success',
                            message: 'User created',
                            data: user,
                            token: token,
                        },
                        status: :created
                    else 
                        render json: {
                            status: 'error',
                            message: 'User not created',
                            data: user.errors,
                        },
                        status: :unprocessable_entity
                    end
                end
            end

            # login a user
            def login
                # find the user in the DB using their email
                user = User.find_by_email(params[:email])
                # check if the user exists and password is authenticate
                if user&.authenticate(params[:password])
                    # generate user token
                    token = encode_token({user_id: user.id, firstname: user.firstname, lastname: user.lastname, email: user.email})
                    render json: {
                        status: 'success',
                        message: 'Login successful',
                        token: token,
                    },
                    status: :ok
                else
                    render json: {
                        status: 'error',
                        message: 'Incorrect email or password',
                    },
                    status: :unprocessable_entity
                end 
            end
            
            private
            def user_params
                params.permit(:firstname, :lastname, :email, :password)
            end
            
            # token hash secret
            SECRET_KEY = Rails.application.secrets.secret_key_base. to_s
      
            # token generator method using the secret
            def encode_token(payload, exp = 24.hours.from_now)
            payload[:exp] = exp.to_i
            JWT.encode(payload, SECRET_KEY) 
            end

        end
    end
end
