class Clearance::UsersController < Clearance::BaseController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def index
    render locals: {
      users: User.all.order(:name)
    }
  end

  def show
    user = User.find(params.fetch(:id))
    if signed_in?
      render template: 'users/show.html.erb', locals: { user: user }
    else
      redirect_to sign_in_path
    end
  end

  def new
    if signed_in?
      redirect_to root_path
    else
      @user = user_from_params
      render template: "users/new.html.erb"
    end
  end

  def create
    @user = user_from_params
    if @user.save
      sign_in @user
      url_after_create
    else
      render template: "users/new.html.erb"
    end
  end

  private
  def redirect_signed_in_users
    if signed_in?
      redirect_to root_path
    end
  end

  def url_after_create
    redirect_to root_path
  end

  def user_from_params
    name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.name = name
      user.email = email
      user.password = password
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end
