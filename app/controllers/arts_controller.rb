class ArtsController < ApplicationController

  @@BUCKET = "chocochomp"
  
  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @arts }
    end
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @art = Art.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @art }
    end
  end

  # GET /arts/new
  # GET /arts/new.json
  def new
    @art = Art.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @art }
    end
  end

  # GET /arts/1/edit
  def edit
    @art = Art.find(params[:id])
  end

  # POST /arts
  # POST /arts.json
  def create
  ## S3

    uploaded_io = params[:art][:file]
    filename = sanitize_filename(uploaded_io.original_filename)
    filepath = "arts/pic" + Time.now.to_i.to_s + filename
    AWS::S3::S3Object.store(filepath, uploaded_io.read, @@BUCKET, :access => :public_read)
    url = AWS::S3::S3Object.url_for(filepath, @@BUCKET, :authenticated => false)
    
    params[:art][:file] = url
    @art = Art.new(params[:art])

    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, :notice => 'Art was successfully created.' }
        format.json { render :json => @art, :status => :created, :location => @art }
      else
        format.html { render :action => "new" }
        format.json { render :json => @art.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /arts/1
  # PUT /arts/1.json
  def update
    @art = Art.find(params[:id])

    respond_to do |format|
      if @art.update_attributes(params[:art])
        format.html { redirect_to @art, :notice => 'Art was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @art.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    begin
      AWS::S3::S3Object.find(@art.file, @@BUCKET).delete
    rescue Exception=>e
      # handle e
    end

    @art = Art.find(params[:id])
    @art.destroy
      
    respond_to do |format|
      format.html { redirect_to arts_url }
      format.json { head :no_content }
    end
  end

  def sanitize_filename(file_name)
    just_filename = File.basename(file_name)
    just_filename.sub(/[^\w\.\-]/,'_')
  end
end
