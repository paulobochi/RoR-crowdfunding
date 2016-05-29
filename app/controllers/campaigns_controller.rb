class CampaignsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_campaign, only: [:show]
  before_action :find_campaign_to_edit, only: [:edit, :update, :destroy]
  
  def index
    @campaigns = Campaign.all.order('created_at DESC')
  end

  def new
    @campaign = current_user.campaigns.build
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)
	
    if @campaign.save
      redirect_to root_path, notice: "Campaign #{@campaign.title} was successfully created."
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
	if @campaign.update(campaign_params)
	  redirect_to campaign_path(@campaign)
	else
	  render 'edit'
	end
  end

  def destroy
	@campaign.destroy
	redirect_to root_path, notice: "Campaign #{@campaign.title} was successfully destroyed."
  end
  
  private

    def campaign_params
      params.require(:campaign).permit(:title, :short_description, :amount_to_raise, :category_id, :picture, :picture_cache, :story, :video_url)
    end

    def find_campaign
      @campaign = Campaign.find(params[:id])
    end
	
	def find_campaign_to_edit
	  @campaign = current_user.campaigns.find(params[:id])
	end

end
