class CandidatesController < ApplicationController

  before_action :candidate_id, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end
  
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to '/candidates', notice: 'Candidate Created!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @candidate.update(candidate_params)
      redirect_to '/candidates', notice: 'Candidate Updated!'
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to '/candidates', notice: 'Candidate Deleted!'
  end

  def vote
    #@candidate.vote = @candidate.vote + 1
    @candidate.vote_logs.create(ip_address:request.remote_ip)
    # VoteLog.create(candidate: @candidate, ip_address: request.remote_ip) 投票紀錄
    # @candidate.increment(:vote) 遞增投票
    # @candidate.save 存檔
    flash[:notice] = "Voted !"
    # VoteMailer.vote_notify('henry@gmail.com').deliver
    VoteMailJob.perform_later
    redirect_to '/candidates'
  end


  private
  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

  def candidate_id
    @candidate = Candidate.find_by(id: params[:id])
  end

end