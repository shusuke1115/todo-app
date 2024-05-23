class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @profile = current_user.build_profile
  #   @gender_options = Profile.genders.invert.map{|key,value|[key,value]}
  # end

  # def create
  #   Rails.logger.debug profile_params.inspect
  #   @profile = current_user.create_profile(profile_params)
  #   if @profile.save
  #     redirect_to @profile, notice: 'Profile was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  before_action :authenticate_user!

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to boards_path, notice: 'プロフィールを更新'
    else
      flash.now[:error] = '更新できなかった'
      render :edit
    end
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def destroy
    @profile = current_user.profile
    @profile.destroy
    redirect_to root_path, notice: 'Profile was successfully destroyed.'
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :birthday, :age, :gender, :user_image)
  end
end