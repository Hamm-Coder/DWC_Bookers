class BooksController < ApplicationController

  def index #index_new
    # 一覧表示(index)部分
    @books = Book.all
    # 新規投稿(new)部分
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクト（Book）を生成する。
    @book = Book.new
  end

  def create #create
    #Createを呼び出す際に、indexで使用する一覧用インスタンス変数＠books（Book.all）を呼び出す。
    @books =Book.all

    #1.&2. データを受取り、新規登録するためのインスタンス変数（Bookクラス用のparams（＠book））を作成する。
    @book = Book.new(book_params)
    #3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      #4-1.フラッシュメッセージを定義し、詳細画面へリダイレクト（登録完了し、詳細(show)へリダイレクト）
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
    #4-2 指定アクション名で同一コントローラー内のviewを同じアクションで表示する。
      render :index
    end
  end

  def show #show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update #update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      #フラッシュメッセージを定義し、詳細画面へリダイレクト（登録完了し、詳細(show)へリダイレクト）
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy #destroy
    book = Book.find(params[:id])# ListModelから、Paramsで、idカラム指定の該当IDのレコードを1件取得
    book.destroy #データ(レコード)削除
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path #リダイレクトbook_path View
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
