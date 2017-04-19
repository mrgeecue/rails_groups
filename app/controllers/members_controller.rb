class MembersController < ApplicationController
  def create
    @organization = Organization.find(params[:organization_id])
    @current_member = Member.find_by(:user_id => current_user.id, :organization_id => @organization.id)
    if !@current_member
      @member = Member.create(user_id: current_user.id, organization_id: @organization.id, count: +1)
      redirect_to organization_path(params[:organization_id])
    end
  end

  def destroy
    @organization = Organization.find(params[:organization_id])
    Member.find_by(user_id: current_user.id, organization_id: @organization.id).destroy
    redirect_to organization_path(params[:organization_id])
  end
end
