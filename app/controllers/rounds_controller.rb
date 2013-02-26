class RoundsController < ApplicationController

  before_filter :find_user_group

  def new
    @round = @user_group.rounds.new(user: current_user) 
  end

  def create
    @round = @user_group.rounds.new(params[:round])
    @round.user = current_user

    if @round.save
      redirect_to @user_group, notice: 'Round created'
    else
      render 'new'
    end
  end

private

  def find_user_group
    @user_group = UserGroup.find(params[:user_group_id])
  end

end
