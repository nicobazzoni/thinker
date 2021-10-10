class IdeasController < ApplicationController
  def index
    ideas = Idea.all
    render json: IdeaSerializer.new(ideas).to_serialized_json
  end

  def create 
    if params[:quote]
      idea = Idea.new(idea_params)
      if idea.save
        render json: IdeaSerializer.new(idea).to_serialized_json
      else
        render json: {errors: idea.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
   
    end
  end 

  def update
    if params[:quote]
      idea = Idea.find_by(id: params[:id])
      if idea.update(idea_params)
        render json: IdeaSerializer.new(idea).to_serialized_json
      else
        render json: {errors: idea.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
    else
      idea = Idea.find_by(id: params[:id])
      idea.increase_times_loved
      render json: IdeaSerializer.new(idea).to_serialized_json
    end
  end

  def destroy
    idea = Idea.find_by(id: params[:id])
    if idea.destroy 
      render json: {message: "Successfully deleted"}
    else
      render json: {error: "There was a problem deleting that Idea."}
    end
  end

  private 

  def idea_params
    params.permit(:quote, :likes, :thinker_ids => [])
  end 
end
