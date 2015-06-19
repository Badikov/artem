class MarkasController < ApplicationController
  before_action :set_marka, only: [:show, :edit, :update, :destroy]
  def index
    @markas = Marka.select("id,name,name2")
    respond_to do |format|
      format.json {render json: @markas}
      format.html {@markas}
    end
  end

  def update
    @marka.update(marka_params)
    redirect_to markas_path
  end

  private
  def set_marka
    @marka = Marka.find(params[:id])
  end
  def marka_params
    params.require(:marka).permit(:name, :name2)
  end

end
