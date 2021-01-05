class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_viewer, only: [:show, :destroy]

  def index
    @viewers = Viewer.all.paginate(page: params[:page], per_page: 25)
  end

  def show;end

  def destroy
    # remove favorites
    @viewer.adjust_favorite_number
    # remove viewer
    @viewer.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_viewer
    @viewer = Viewer.find(params[:id])
  end
end
