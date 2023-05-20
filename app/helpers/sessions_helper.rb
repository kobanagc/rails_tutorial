puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\n☆★☆★☆\n\n"

module SessionsHelper
  puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\n☆★☆★☆\n\n"

  def log_in(user)
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nlog_in method\n☆★☆★☆\n\n"

    session[:user_id] = user.id
  end

  def remember(user)
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nremember method\n☆★☆★☆\n\n"

    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\ncurrent_user method\n☆★☆★☆\n\n"

    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\ncurrent_user? method\n☆★☆★☆\n\n"

    user && user == current_user
  end

  def logged_in?
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nlogged_in? method\n☆★☆★☆\n\n"

    !current_user.nil?
  end

  def forget(user)
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nfoget method\n☆★☆★☆\n\n"

    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nlog_out method\n☆★☆★☆\n\n"

    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nredirect_back_or method\n☆★☆★☆\n\n"

    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    puts "\n☆★☆★☆\nhelpers/sessions_helper.rb\nmodule SessionsHelper\nstore_location method\n☆★☆★☆\n\n"

    session[:forwarding_url] = request.original_url if request.get?
  end
end