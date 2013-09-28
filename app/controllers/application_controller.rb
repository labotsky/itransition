class ApplicationController < ActionController::Base
  protect_from_forgery  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :can_denied
  before_filter :authenticate_user!
  before_filter :set_locale

private
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  def default_url_options(options={})
    {locale: I18n.locale}    
  end

  def record_not_found
    render :file => "public/404", :layout => false, :status => 404
  end

  def can_denied
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end
