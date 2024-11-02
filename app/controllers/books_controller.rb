class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクト（List）を生成する。
    @list = List.new
  end
  
  def create
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

  def show
    
  end

  def edit
  end
end
