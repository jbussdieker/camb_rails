class LoadTestsController < ApplicationController
  # GET /tests
  # GET /tests.json
  def index
    @tests = LoadTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test = LoadTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/new
  # GET /tests/new.json
  def new
    @test = LoadTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @test = LoadTest.find(params[:id])
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = LoadTest.new(params[:load_test])

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render json: @test, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.json
  def update
    @test = LoadTest.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:load_test])
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test = LoadTest.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to load_tests_url }
      format.json { head :no_content }
    end
  end

  def start
    @test = LoadTest.find(params[:id])
    @test.delay.start

    respond_to do |format|
      format.html { redirect_to load_tests_url }
      format.json { head :no_content }
    end
  end

  def data
    @test = LoadTest.find(params[:id])
    @result = @test.load_test_results.where("timestamp > ?", params[:timestamp])
    @data = {
      :results => @result.collect {|r| [r.probe_id - 1, r.timestamp, r.total_time]},
      :status => @test.status
    }

    respond_to do |format|
      format.html
      format.json { render json: @data }
    end
  end
end
