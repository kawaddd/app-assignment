class BooksController < ApplicationController

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])  
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # 4. 作成した本の詳細画面へリダイレクト
    redirect_to book_path(@book.id)
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
