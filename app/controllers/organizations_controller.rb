class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organization_url(@organization)
      flash[:notice] = "Organization added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      redirect_to organization_url(@organization)
      flash[:notice] = "Organization updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path
    flash[:notice] = "Organization was deleted!"
  end

  private
    def organization_params
      params.require(:organization).permit(:domain)
    end

    def set_organization
      begin
        @organization = Organization.find(params[:id])
      rescue
        redirect_to organizations_path
      end
    end
end
