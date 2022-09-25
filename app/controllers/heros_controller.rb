class HerosController < ApplicationController
  before_action :set_hero, only: %i[ show edit update destroy ]
  before_action :set_heros, only: [:show, :index]
  layout 'application'
  # GET /heros or /heros.json
  def index
  end

  # GET /heros/1 or /heros/1.json
  def show
    @attributes_to_display = @hero.attributes.symbolize_keys.slice(:name, :hp, :shield, :armor)
  end

  # GET /heros/new
  def new
    @hero = Hero.new
  end

  # GET /heros/1/edit
  def edit
  end

  # POST /heros or /heros.json
  def create
    @hero = Hero.new(hero_params)

    respond_to do |format|
      if @hero.save
        format.html { redirect_to hero_url(@hero), notice: "Hero was successfully created." }
        format.json { render :show, status: :created, location: @hero }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heros/1 or /heros/1.json
  def update
    hero_id = params[:id]
    advantage_hero_ids = params[:hero][:advantage_hero_ids].reject!(&:empty?)
    Hero.find_by(id: hero_id)
    .update(advantage_hero_ids: advantage_hero_ids)

    respond_to do |format|
      if @hero.update(hero_params)
        format.html { redirect_to hero_url(@hero), notice: "Hero was successfully updated." }
        format.json { render :show, status: :ok, location: @hero }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heros/1 or /heros/1.json
  def destroy
    @hero.destroy

    respond_to do |format|
      format.html { redirect_to heros_url, notice: "Hero was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # For now, only work with OW1 heroes
  def self.all
    from_version('1')
  end

  # Returns heros from version. Returns latest by default
  def self.from_version(version)
    latest_version = Game.all.order('version desc').pluck(:version)[0]
    Hero.all
    .joins(:game)
    .order(:version)
    .where('version = ?', latest_version)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    def set_heros
      @heros = Hero.all.order(:name)
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.require(:hero).permit(:name, :role_id, :advantage_hero_ids, hard_counters_attributes: [:advantage_hero_ids])
    end
end
