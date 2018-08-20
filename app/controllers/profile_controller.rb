class ProfileController < ApplicationController
    
    def index
        @board = Board.where(profile_id: params[:user_id])
        @pro = Profile.find(params[:user_id])
        @user = @pro.user
    end
    
    def album
        @user = User.find(params[:user_id])
        @profile = Profile.where(user_id: params[:user_id])
        @profile_user = (params[:user_id]).to_i
    end
    
    def archive
        @user = User.find(params[:user_id])
        @board = Board.where(profile: @user.profiles)
    end
    
    def mypage
        @user = User.find(params[:user_id])
        @board = Board.where(profile: @user.profiles).reverse
    end
    
    def ingame
        @user = User.find(params[:user_id])
        @board = Board.where(profile: @user.profiles)
    end
    
    def follow
        @user = User.find(params[:user_id])
        current_user.follow(@user)
        respond_to :js
    end
    
    def unfollow
        @user = User.find(params[:user_id])
        current_user.stop_following(@user)
        respond_to :js
    end
    
    def new
        @categories = Category.all.map { |cat| [cat.name, cat.id] }
    end

    def create
        @profile = Profile.new
        @profile.user_id= params[:user_id]
        @profile.category_id = params[:category_id]
        @profile.save
        @userid = current_user.id
        redirect_to "/profile/#{@userid}/album"
    end

    def edit2
        @profile = Profile.find(params[:id])
    end
    
    def update
        @profile = Profile.find(params[:id])
        @profile.category_id = params[:category_id]
        @profile.save
        @userid = current_user.id
        redirect_to "/profile/#{@userid}/album"
    end
    
    def show
        @profile = Profile.find(params[:id])
        @temp = params[:user_id]
    end
    
    def destroy
        @profile = Profile.find(params[:id])
        @profile.destroy
        redirect_to(:back)
    end
    
    def tagged
    end
end