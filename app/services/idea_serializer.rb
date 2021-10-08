class IdeaSerializer

    def initialize(idea_object)
      @idea = idea_object
    end
  
    def to_serialized_json
      @idea.to_json(:except => [:created_at, :updated_at],
      :include => {
        :thinkers => {:only => [:name, :image, :id, :times_studied]}
      })
    end
    
  end