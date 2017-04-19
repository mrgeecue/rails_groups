class OrganizationsController < ApplicationController
  before_action :require_login, only: [:index, :create, :show, :destroy]
  def index
    @organizations = Organization.all
    @members = Member.all
  end

  def create
    @organization = current_user.organizations.new(organization_params)
      if @organization.save
        Member.create(user_id: current_user.id, organization_id: @organization.id, count: 1)
        redirect_to '/organizations'
      else
        flash[:error] = @organization.errors.full_messages.to_s
        redirect_to '/organizations'
      end
  end

  def new
  end

  def show
    @organization = Organization.find(params[:id])
    @members = @organization.joined_users
  end

  def join_organization
    @organization = Organization.find(params[:id])
    @member = Member.create(user_id: current_user.id, organization_id: @organization.id, count: +1)
  end

  def update
  end

  def destroy
    @organization = Organization.find(params[:id]).destroy
    redirect_to '/organizations'
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :description, :user_id)
  end

end
