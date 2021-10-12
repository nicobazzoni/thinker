class ThinkersController < ApplicationController
  def index
    if params["filter"].present?
      params["filter"] == "all" ? filtered_thinkers = Thinker.all : filtered_thinkers = Thinker.where(category: params["filter"])
      sorted_thinkers = Thinker.sort(filtered_thinkers, params["sort"])
      params["query"].present? ? thinkers = sorted_thinkers.where("name LIKE ?", "%#{params[:query]}%") :  thinkers = sorted_thinkers
    else
        thinkers = Thinker.all.order(:name)
    end
      render json: ThinkerSerializer.new(thinkers).to_serialized_json
  end 

  def create
    thinker = Thinker.new(thinker_params)
    if thinker.save
      render json: ThinkerSerializer.new(thinker).to_serialized_json
    else
      render json: {errors: Thinker.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def update
    if params[:name]
      thinker = Thinker.find_by(id: params[:id])
      if thinker.update(thinker_params)
        render json: ThinkerSerializer.new(thinker).to_serialized_json
      else
        render json: {errors: Thinker.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
    else
      thinker = Thinker.find_by(id: params[:id])
      thinker.increase_times_studied
      render json: ThinkerSerializer.new(thinker).to_serialized_json
    end
      
  end

  def destroy
    thinker = Thinker.find_by(id: params[:id])
    if thinker.destroy 
      render json: {message: "Successfully deleted"}
    end
  end

  private

  def thinker_params
    params.permit(:name, :image, :times_studied, :personality, :category_name)
  end
end
