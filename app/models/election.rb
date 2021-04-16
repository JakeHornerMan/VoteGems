#title:string 
#created_by:string 
#ispublic:boolean 
#participants:string

class Election < ApplicationRecord
    has_many :candidates, dependent: :destroy

    validates :title, presence: true

    def getcreatedby(user)
        self.created_by = user
    end
end
