class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]



  # GET /collections
  # GET /collections.json
  def index
    if user_signed_in?
    @collection = current_user.collections
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    if session[:active_collection] = nil
      session[active_collection] = @collection
    else
      session.delete(:active_collection)
      session[:active_collection] = @collection
    end
    @collection = Collection.find(params[:id])
    @record = @collection.records
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    params.permit!
    @collection = Collection.new(params[:collection])

    respond_to do |format|
      if @collection.save
        @collection.users << current_user
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @collection }
      else
        format.html { render action: 'new' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    params.permit!
    respond_to do |format|
      if @collection.update(params[:collection])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params[:collection]
    end
end
