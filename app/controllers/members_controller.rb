class MembersController < ApplicationController
  before_action :set_current_tenant, only: [:index]
  def index
    @members = @current_tenant.members
  end

  def set_current_tenant
    @current_tenant = Tenant.find(params[:tenant_id])
  end
end
