class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy,  status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    render json: toy
  rescue ApplicationRecord::RecordNotFound
    render_not_found_response
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  rescue ApplicationRecord::RecordNotFound
    render_not_found_response
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
