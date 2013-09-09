class RecordsController < ApplicationController

  # GET /records
  # GET /records.json
  def index
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @record = Record.find(params[:id])

  end

  # GET /records/new
  def new
    @collection = session[:active_collection]
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
    @record = Record.find(params[:id])

  end

  # POST /records
  # POST /records.json
  def create
    params.permit!
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        @record.collections <<  session[:active_collection]
        format.html { redirect_to collection_path(session[:active_collection]), notice: 'Record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @record }
      else
        format.html { render action: 'new' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    params.permit!
    respond_to do |format|
      if @record.update(:record)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    respond_to do |format|
      format.html { redirect_to collection_path(session[:active_collection]) }
      format.json { head :no_content }
    end
  end

  def select
    require "net/http"
    require "uri"

    uri = URI.parse("https://www.googleapis.com/books/v1/volumes? + @search_terms")

    # Shortcut
    response = Net::HTTP.get_response(uri)

    # Will print response.body
    Net::HTTP.get_print(uri)

    # Full
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
  end
end