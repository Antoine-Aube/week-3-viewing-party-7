class Admin::DashboardController < ApplicationController
  before_action :require_admin

  def index
    @default_users = User.where(role: 0)
  end

  private

  def require_admin
    render file: "public/404.html" unless current_admin?
  end
end