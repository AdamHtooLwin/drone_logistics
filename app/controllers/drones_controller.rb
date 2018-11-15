class DronesController < ApplicationController
  require 'riak'
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  # GET /drones
  # GET /drones.json
  def index
    @drones = Drone.all

    @orion = riak_show
  end

  # GET /drones/1
  # GET /drones/1.json
  def show
  end

  # GET /drones/new
  def new
    @drone = Drone.new
  end

  # GET /drones/1/edit
  def edit
  end

  # POST /drones
  # POST /drones.json
  def create
    @drone = Drone.new(drone_params)

    riak_create

    respond_to do |format|
      if @drone.save
        format.html { redirect_to @drone, notice: 'Drone was successfully created.' }
        format.json { render :show, status: :created, location: @drone }
      else
        format.html { render :new }
        format.json { render json: @drone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drones/1
  # PATCH/PUT /drones/1.json
  def update
    respond_to do |format|
      if @drone.update(drone_params)
        format.html { redirect_to @drone, notice: 'Drone was successfully updated.' }
        format.json { render :show, status: :ok, location: @drone }
      else
        format.html { render :edit }
        format.json { render json: @drone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drones/1
  # DELETE /drones/1.json
  def destroy
    @drone.destroy
    respond_to do |format|
      format.html { redirect_to drones_url, notice: 'Drone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drone
      @drone = Drone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drone_params
      params.require(:drone).permit(:name, :status, :carrying_capacity, :price, :acquired_date, :weight)
    end

    def riak_create()
      client = Riak::Client.new

      drone_data = drone_params

      d_bucket = client.bucket('drone')
      new_drone = d_bucket.new("#{drone_data[:name]}")
      new_drone.data = drone_data
      new_drone.content_type = 'application/json'
      new_drone.store()
    end

    def riak_show()
      client = Riak::Client.new
      d_bucket = client.bucket('drone')
      # drone_names = d_bucket.keys
      # drones_data = []
      #
      # for drone_name in drone_names
      #   drone = d_bucket.get(drone_name)
      #   drone_data = drone.data
      #   drones_data.append(drone_data)
      # end

      drone = d_bucket.get('Gaia')

      drone_data = drone.data
      return drone_data
    end


end
