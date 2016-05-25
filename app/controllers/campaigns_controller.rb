class CampaignsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :find_campaign, only: [:show]
  def index
    @campaigns = Campaign.all.order('created_at DESC')
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.campaign_type = :project

    if @campaign.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  private

    def campaign_params
      params.require(:campaign).permit(:title, :amount_to_raise)
    end

    def find_campaign
      @campaign = Campaign.find(params[:id])
    end

end
