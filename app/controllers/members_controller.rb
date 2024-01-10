class MembersController < ApplicationController
  before_action :set_current_tenant, only: [:index, :invite]

  def index
    @members = @current_tenant.members
  end

  def invite
    email = params[:email]
    pp "hello", email, email.blank?
    return redirect_to tenant_members_path(@current_tenant), alert: 'No email provided' if email.blank?
    user = User.find_by(email: email) || User.invite!({ email: email }, current_user)
    pp "user", user
    return redirect_to tenant_members_path(@current_tenant), alert: 'Email is invalid' unless user.valid?
    user.members.find_or_create_by(tenant: @current_tenant, roles: JSON.generate({ admin: false, editor: true }))
    redirect_to tenant_members_path(@current_tenant), notice: "#{email} invited!"
  end

  def set_current_tenant
    @current_tenant = Tenant.find(params[:tenant_id])
  end
end
