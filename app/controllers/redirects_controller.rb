class RedirectsController < ApplicationController
  def index
    # Pretty sure there's a better way, this is ugly and messy
    # @urls = Redirect.all.joins(:redirect_histories).group(:id).order('COUNT(redirect_histories.id) DESC')
    @urls = Redirect.all.order(created_at: :desc)
  end

  def new
    @url = Redirect.new
  end

  def create
    @url = Redirect.new(redirect_params)
    if @url.save
      flash.now[:notice] = "Created successfully!"
      redirect_to edit_redirect_path(@url)
    else
      flash.now[:error] = "Error!"
      render "new"
    end
  end

  def edit
    @url = Redirect.find(params[:id])
  end

  def show
    @url = Redirect.find(params[:id])
    render "edit"
  end

  def update
    @url = Redirect.find(params[:id])
    if @url.update_attributes(redirect_params)
    else
    end
  end

  def destroy
    if @url = Redirect.find(params[:id])
      @url.destroy
      flash.now[:notice] = "Deleted!"
      redirect_to redirects_path
    else
      flash.now[:error] = "Something went wrong!"
      redirect_to redirects_path
    end
  end

  # This is the short URL, redirect (if found) to full_url
  def redirect
    # Does it exist?
    if url = Redirect.find_by_short_url(params[:id])
      # # Increment count
      # url.update_attributes(count: url.count + 1)
      # Add redirect to history
      RedirectHistory.create(redirect_id: url.id, notes: "params: #{params}")
      # Redirect
      redirect_to url.full_url
    else
      redirect_to redirects_path
    end
  end

  # Ability to sort most popular redirects by timespan
  def report
    @urls = Redirect.joins(:redirect_histories).group(:id).order('COUNT(redirect_histories.id) DESC').all
    # @urls = Redirect.joins(:redirect_histories).all
    # If before date
    if !params[:date_before].blank?
      @urls = @urls.where('redirect_histories.created_at <= ?', params[:date_before])
    end
    # If after date
    if !params[:date_after].blank?
      @urls = @urls.where('redirect_histories.created_at >= ?', params[:date_after])
    end
  end

  private

  def redirect_params
    params.require(:redirect).permit(:full_url, :short_url)
  end
end
