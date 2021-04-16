class CandidatesController < ApplicationController

before_action :set_candidate, only: [:upvote, :downvote]

    def new
        @candidate = Candidate.new
        if session[:election_id]
            if nil !=session[:election_id]
                @election = Election.find(session[:election_id])
            end
        else
            redirect_to root_path, alert: "Something was wrong"
        end
    end

    def create
        @candidate = Candidate.new(candidate_params)
        @candidate.election_id = session[:election_id]
        @candidate.score = 0
        if @candidate.save
            flash[:alert] = "Created Candidate: " + @candidate.name 
            #render :new 
            redirect_to create_candidates_path
        else
            render :new
        end
    end

    def finish
        session[:election_id] = nil
        redirect_to root_path, notice: "Successfully created Election!"
    end

    def view 

        @currentcandidates = Candidate.all.where(election_id: session[:election_id]) 
        @theelection = Election.all.find(@currentcandidates.first.election_id)
        
    end

    def upvote
        @candidate.upvote_from Current.user
        redirect_to view_candidates_path
    end

    def downvote
        @candidate.downvote_from Current.user
        redirect_to view_candidates_path
    end

    private
    def set_candidate
        @candidate = Candidate.find(params[:format])
    end

    def candidate_params
        params.require(:candidate).permit(:name, :image)
    end

end
