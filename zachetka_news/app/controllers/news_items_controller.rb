# frozen_string_literal: true

class NewsItemsController < ApplicationController
  before_action :set_news_item, only: %i[show edit update destroy]
  before_action :check_admin

  NEWS_TYPE_PARAM_NAME = 'news_type'
  NEWS_ITEM_PARAM_NAME = 'news_item'

  def index
    @news_items = NewsItem.all
  end

  def show
    redirect_to news_items_path
  end

  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params.to_h.reject { |k| k.eql?(NEWS_TYPE_PARAM_NAME) })
    @news_item.news_type = NewsType.find_by(type_name: params[NEWS_ITEM_PARAM_NAME][NEWS_TYPE_PARAM_NAME])

    if @news_item.save
      redirect_to @news_item, notice: 'News successfully created'
    else
      redirect_to new_news_item_path, notice: 'Parameters cant be empty'
    end
  end

  def update
    puts "TEST #{news_item_params}"
    if @news_item.update(news_item_params)
      redirect_to @news_item, notice: 'News successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @news_item.destroy
    redirect_to news_items_url, notice: 'News successfully deleted'
  end

  private

  def check_item_params(params)
    params.values.all?(&:present?)
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  def news_item_params
    params.fetch(:news_item, {}).permit(:title, :subtitle, :source_url, :news_type)
  end

  def check_admin
    redirect_to home_path unless current_user&.is_admin
  end
end
