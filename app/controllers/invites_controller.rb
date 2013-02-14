class InvitesController < ApplicationController

  before_filter :find_user_group

  def show
    @invite = @user_group.invites.find(params[:id])
    if request.path != user_group_invite_path(@user_group, @invite)
      redirect_to @user_group, alert: "Invite not found"
    end
  end

  def new
    @invite = @user_group.invites.new
  end

  def create
    @invite = @user_group.invites.build(params[:invite])

    if @invite.save
      redirect_to root_url, notice: 'Invite sent successfully'
    else
      render 'new'
    end
  end

private

  def find_user_group
    @user_group = UserGroup.find(params[:user_group_id])
  end

end
