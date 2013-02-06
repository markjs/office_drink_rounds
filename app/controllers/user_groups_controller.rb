class UserGroupsController < ApplicationController
  before_filter :find_user_group, except: [:new, :create]

  def show
  end

  def new
    @user_group = UserGroup.new
  end

  def create
    @user_group = User.new params[:user_group]
    if @user_group.save
      redirect_to @user_group, notice: 'User group created'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user_group.update_attributes params[:user_group]
      redirect_to @user_group, notice: 'User group updated'
    else
      render 'edit'
    end
  end

private

  def find_user_group
    @user_group = UserGroup.find(params[:id])
  end

end
