class InvitesController < ApplicationController

  before_filter :find_user_group
  before_filter :find_invite, except: [:new, :create]

  def show
    # This is to stop invites being accessed by ID. Only the token is allowed.
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

  def new_user
    @user = @user_group.users.new(email: @invite.email)
  end

  def create_user
    @user = @user_group.users.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user_group, notice: 'Thanks for signing up!'
    else
      render 'new_user'
    end
  end

private

  def find_user_group
    @user_group = UserGroup.find(params[:user_group_id])
  end

  def find_invite
    @invite = @user_group.invites.find(params[:invite_id] || params[:id])
    if @invite.created_at < 2.days.ago
      redirect_to @user_group, alert: "Invite has expired"
    end
  end
end
