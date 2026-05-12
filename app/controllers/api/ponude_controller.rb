class Api::PonudeController < ApplicationController

  before_action :authenticate_request, only: [:create]

  def index
    ponude = Ponuda.all
    render json: ponude
  end

  def create
    ponuda = Ponuda.new(ponuda_params)
    if ponuda.save
      render json: ponuda, status: :created
    else
      render json: ponuda.errors, status: :unprocessable_entity
    end
  end

  private

  def ponuda_params
    params.require(:ponuda).permit(:naziv, :lokacija, :lat, :lng, :vrijeme, :satnica, :placanje)
  end
end