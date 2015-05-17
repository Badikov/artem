class BlackListsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: :index
  before_action :set_black_list, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @black_lists = BlackList.all
    respond_with(@black_lists)
  end

  def show
    respond_with(@black_list)
  end

  def new
    @black_list = BlackList.new
    respond_with(@black_list)
  end

  def edit
  end

  def create
    @black_list = BlackList.new(black_list_params)
    @black_list.save
    respond_with(@black_list)
  end

  def update
    @black_list.update(black_list_params)
    respond_with(@black_list)
  end

  def destroy
    @black_list.destroy
    respond_with(@black_list)
  end

  private
    def set_black_list
      @black_list = BlackList.find(params[:id])
    end

    def black_list_params
      params.require(:black_list).permit(:phone, :coment)
    end
end
