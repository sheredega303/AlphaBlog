class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] # Перед выполнением этих методов выполняем метод указанный ранее
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5) # Передаем в переменную артиклс все наши статьи (При использовании педжинейшн)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params) # Если прошло валидацию
      flash[:notice] = "Article was updated!"
      redirect_to @article
    else
      render 'edit' # Рендерим страницу по новой + отображаем ошибки
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user # Передаем значению автора значение текущего пользователя в логине
    if @article.save
      flash[:notice] = "Article was created!"
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id]) # Берет значение ИД из роута
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: []) # Возвращает значения из метода ПОСТ
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin? # Проверка админку и соотношения текущего пользоавтеля
      flash[:alert] = "You can only edit or delete your articles!"
      redirect_to @article
    end
  end
end