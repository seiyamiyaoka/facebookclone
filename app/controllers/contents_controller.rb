class ContentsController < ApplicationController
  before_action :set_content , only:[:show,:edit,:upadate,:destroy]
  def index
    @contents = Content.all
  end

  def new
    if params[:back]
      @content = Content.new(content_params)
    else
      @content = Content.new
    end
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to contents_path, notice: "コンテンツを作成しました"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to contents_path, notice:"編集しました！"
    end
  end

  def destroy
    @content.destroy
    redirect_to contents_path, notice:"削除しました！"
  end

  def confirm
    @content = Content.new(content_params)
    render :new if @content.invalid?
  end

private

  def content_params
    params.require(:content).permit(:content)
  end

  def set_content
    @content = Content.find(params[:id])
  end

end
