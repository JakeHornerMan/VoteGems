#name:string 
#image:string 
#score:integer

class Candidate < ApplicationRecord
    acts_as_votable
    belongs_to :election

    validates :name, presence: true
end
