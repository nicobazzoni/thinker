class ThinkerSerializer

    def initialize(thinker_object)
      @thinker = thinker_object
    end
  
    def to_serialized_json
      @thinker.to_json(:only => [:id, :name,  :image, :personality,  :times_studied],  
      :include => {
        :category => {:only => [:name]}
      })
    end
    
  end