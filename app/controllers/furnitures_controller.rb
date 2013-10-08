
require 'csv'
class FurnituresController < ApplicationController
  # GET /furnitures
  # GET /furnitures.json
  def index
    @furnitures = Furniture.all
    @temp = Temp.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @furnitures }
    end
  end

  # GET /furnitures/1
  # GET /furnitures/1.json
  def show
    @search_results = FilterResult.where(:filter_id => params[:id])
    @search_results =  @search_results.order("height ASC")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @furniture }
    end
  end

  # GET /furnitures/new
  # GET /furnitures/new.json
  def new
    @furniture = Furniture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @furniture }
    end
  end

  # GET /furnitures/1/edit
  def edit
    @furniture = Furniture.find(params[:id])
  end

  # POST /furnitures
  # POST /furnitures.json
  def create
   
    infile = params[:csv_file].read
    
    CSV.parse(infile) do |row|
      furniture = Furniture.new
      furniture.kind = row[0]
      furniture.height = row[1].to_i
      furniture.emergency_exit = (row[2] == "True" ? true : false)
      furniture.openable =  (row[3] == "True" ? true : false)
      furniture.save
   end
    all_results = Furniture.find(:all)
   
    respond_to do |format|
      if all_results
        format.html { redirect_to furnitures_path, notice: 'Furniture was successfully created.' }
        
      else
        format.html { render action: "new" }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /furnitures/1
  # PUT /furnitures/1.json
  def update
    @furniture = Furniture.find(params[:id])

    respond_to do |format|
      if @furniture.update_attributes(params[:furniture])
        format.html { redirect_to @furniture, notice: 'Furniture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @furniture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /furnitures/1
  # DELETE /furnitures/1.json
  def destroy
    @furniture = Furniture.find(params[:id])
    @furniture.destroy

    respond_to do |format|
      format.html { redirect_to furnitures_url }
      format.json { head :no_content }
    end
  end
  
  def search
   kind = params[:search]
   results = Furniture.where(kind) 
   @t = Temp.create(:filter_id => 1)
   results.each do |result|
     fr = FilterResult.new
     fr.kind = result.kind
     fr.height= result.height
     fr.emergency_exit= result.emergency_exit
     fr.openable= result.openable
     fr.filter_id = @t.id
     fr.save
  end
   @search_results = FilterResult.where(:filter_id => @t.id)
   @search_results =  @search_results.order("height DESC") if params[:order] == "desc"
   @search_results =  @search_results.order("height ASC") if params[:order] == "asc"
  
  end
end
