class BooksController < ApplicationController
  def index
    @book=Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]) 
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Post was successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    # flash[:success] = "Edit was successfully"
    # redirect_to book_path(book.id)  
    if @book.save
      flash[:success] = "Edit was successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
     book = Book.find(params[:id])  # データ（レコード）を1件取得
	   book.destroy  # データ（レコード）を削除
	   flash[:success] = "Book was successfully destroyed."
	   redirect_to "/books"  # 投稿一覧画面へリダイレクト
  end
  
  private #createアクションの内部でのみ使用可能
	def book_params
	    params.require(:book).permit(:title, :body)# ストロングパラメータ
	end
end
