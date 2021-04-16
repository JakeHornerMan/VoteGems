class ElectionsController < ApplicationController
    
    before_action :require_user_logged_in!, only: [:create, :new, :view]
    before_action :set_election, only: [:select]
    before_action :index, only: [:search]

    def index
       
    end

    def search

        @searchterm = Election.where(["title LIKE ?","%#{params[:search]}%"])
        
        @searchelections = Election.all.where(title: @searchterm) 
        
    end

    def new
        @election = Election.new
    end

    def create
        @election = Election.new(election_params)
        @election.created_by = Current.user.email
        if @election.save
            session[:election_id] = @election.id
            redirect_to create_candidates_path, notice:"Created Election"
        else
            flash[:alert] = "Something was wrong"
            render :new 
        end
    end

    def view
        
        @publicelections = Election.all.where(ispublic: true)

        @createdbyelections = Election.all.where(created_by: Current.user.email)
        
        @privelections = Election.all.where(ispublic: false)
        @privelections.each do |election|
            if election.participants.include? Current.user.email
                @ans.add(election)
            else
                @ans = Election.new
            end
        end
    end

    def select
        session[:election_id] = @Election.id
        redirect_to view_candidates_path
    end

    private
    def set_election
        @Election = Election.find(params[:format])
    end

    def election_params
        params.require(:election).permit(:title, :ispublic, :participants)
        #params.created_by =  Current.user.email
    end

end