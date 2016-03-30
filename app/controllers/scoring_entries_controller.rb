class ScoringEntriesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @scoring_entries = ScoringEntry.all
  end

  def new
    @scoring_entry = ScoringEntry.new
    @scoring_entry.user_id = current_user.id
    @scoring_entry.game_id = Game.all.order(:year).last.id
  end

  def create
    @scoring_entry = ScoringEntry.create(scoring_entry_params)
    if @scoring_entry.save
      flash[:success] = "Scoring entry created"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @scoring_entry = ScoringEntry.find(params[:id])
  end

  def update
    @scoring_entry = ScoringEntry.find(params[:id])
    if @scoring_entry.update_attributes(scoring_entry_params)
      flash[:success] = "Scoring entry updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @scoring_entry = ScoringEntry.find(params[:id])
    @scoring_entry.destroy
    flash[:success] = "Scoring entry destroyed"
    redirect_to root_path
  end

  private

    def scoring_entry_params
      params.require(:scoring_entry).permit(:id, :game_id, :user_id, :team_number, :notes).tap do |whitelisted|
        whitelisted[:properties] = params[:scoring_entry][:properties]
      end
    end
end
