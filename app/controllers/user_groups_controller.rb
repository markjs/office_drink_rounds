class UserGroupsController < ApplicationController

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
end
