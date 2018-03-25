# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @matches = @user.complete_matches.includes(:winner, :player_one, :player_two)
    @paginated_matches = @matches.paginate(page: params[:page]).order(created_at: :desc)
  end
end
