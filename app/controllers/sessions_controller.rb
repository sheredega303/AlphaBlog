class SessionsController < ApplicationController
  def new # Метод ГЕТ, отображает только вьюшку

  end

  def create # ПОСТ
    user = User.find_by(email: params[:session][:email].downcase) # Находим пользователя по почте, которую передали в скоуп :сессия, обращаемся к почте, приводим к нижнему регистру
    if user && user.authenticate(params[:session][:password]) # Если юзер существует и паспорт соответствует
      session[:user_id] = user.id # Присваиваем сессии юзера значение юзер ИД
      flash[:notice] = 'Login was successful!'
      redirect_to user
    else
      flash.now[:alert] = 'There was something wrong with ur login details' # Тут нет редиректа, поэтому нужно делать так
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil # Очищаем сессию
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end