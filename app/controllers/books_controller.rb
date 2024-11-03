class BooksController < ApplicationController

  def index #index_new
    @books = Book.all
    # 新規投稿(new)部分
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクト（Book）を生成する。
    @book = Book.new
  end

#  def new
#    # Viewへ渡すためのインスタンス変数に空のModelオブジェクト（Book）を生成する。
#    @book = Book.new
#  end

  def create #create
    #1.&2. データを受取り、新規登録するためのインスタンス変数（Modelオブジェクト用のparams（List）、オブジェクト）を作成する。
    @book = Book.new(book_params)
    #3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      #4-1.フラッシュメッセージを定義し、詳細画面へリダイレクト（登録完了し、トップ画面へリダイレクト）
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book.id)
    else
    #4-2 指定アクション名で同一コントローラー内の別アクションのviewを表示する。
      flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      render :new

    end
  end

  def show #show
    @book = Book.find(params[:id])
  end

  def update #update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy #destroy
    book = Book.find(params[:id])# ListModelから、Paramsで、idカラム指定の該当IDのレコードを1件取得
    book.destroy #データ(レコード)削除
    redirect_to '/books' #リダイレクトbooks View
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body,)

  end
end
