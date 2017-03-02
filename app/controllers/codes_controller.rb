class CodesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @codes = Code.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Code.create(image: code_params[:image], text: code_params[:text], user_id: current_user.id)
    end

  def destroy
    code = Code.find(params[:id])
    code.destroy if code.user_id == current_user.id
  end

  def edit
    @code = Code.find(params[:id])
  end

  def update
    code = Code.find(params[:id])
    if code.user_id == current_user.id
      code.update(code_params)
    end
  end

  def show
    @code = Code.find(params[:id])
    @comments = @code.comments.includes(:user)
  end

  private
  def code_params
    params.permit(:image, :text)
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end

end
