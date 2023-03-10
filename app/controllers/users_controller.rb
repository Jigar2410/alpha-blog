class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the Alpha blog #{@user.username}"
            redirect_to articles_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Your account was successfully updated"
            redirect_to articles_path
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
    end
    
    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end