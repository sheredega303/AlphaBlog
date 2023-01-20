class ApplicationController < ActionController::Base # Методы для контроллеров

  helper_method :current_user, :logged_in? # Передаём эти методы в хелпер (для вью)

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # Если значение текущего юзера не задано, задаем ему значение авторизованого пользователя
  end

  def logged_in?
    !!current_user # Булевое значение, отвечающее за логин
  end

  def require_user # Не залогинин = редирект на логин
    if !logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end
end
