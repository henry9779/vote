class CandidatesController < ApplicationController

  def index
    @candidates = Candidate.all
  end
  
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      flash[:notice] = "Candidate created !"
      redirect_to '/candidates'
    else
      render :new
    end
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_params)
      flash[:notice] = "Candidate Updated !"  
      redirect_to '/candidates'
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    flash[:notice] = "Candidate Deleted !"
    redirect_to '/candidates'
  end

  def vote
    @candidate = Candidate.find_by(id: params[:id])
    #@candidate.vote = @candidate.vote + 1
    @candidate.increment(:vote)
    @candidate.save
    flash[:notice] = "Voted !"
    redirect_to '/candidates'
  end


  private
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

end