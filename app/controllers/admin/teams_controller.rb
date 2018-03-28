class Admin::TeamsController < AdminsController
  layout "admin"

  def index
    @teams = Team.all
    @team = Team.new
  end

  def new
    @team = Team.new
  end

  skip_before_action :verify_authenticity_token
  def create
    @team = Team.create(team_params)
    listTeam = Team.all
    if @team.valid?
      respond_to do |format|
        format.html { redirect_to controller: 'teams', action: 'index', notice: 'success' }
        format.js   {}
        format.json { render json: @team, status: :created, location: @team }
      end
      # handle create new battle for this team
      listTeam.each do |team|
        # duyet qua moi doi sau do tao 1 tran dau giua doi nay voi doi vua add vao db
        if @team.id != team.id

          battle1 = Battle.new
          battle1.id_team_a = team.id
          battle1.id_team_b = @team.id
          battle1.save

          battle2 = Battle.new
          battle2.id_team_a = @team.id
          battle2.id_team_b = team.id
          battle2.save
        else
          battle1 = Battle.new
          battle1.id_team_a = team.id
          battle1.id_team_b = @team.id
          battle1.save
        end
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def table
    @teams = Team.all
    arr = @teams.to_a
    @battle = Battle.all
    @teams_length = @teams.length
    #create multi array
    @result_table = Array.new
    (0...@teams_length).each do |row|
      # get battle form battles table database where id
      battle_of_team = Battle.where("id_team_a = " + @teams[row].id.to_s).order(:id_team_b)
      # create row for table. Each team battle all team
      row_table = Array.new
      row_table << @teams[row].name
      battle_of_team.each do |battle|
        cell_table = Array.new
        cell_table<<battle.id
        if @teams[row].id != battle.id_team_b
          if (battle.score_team_a == nil || battle.score_team_b == nil)
            cell_table<<"---"
          else
            cell_table<<battle.score_team_a.to_s + " - " + battle.score_team_b.to_s
          end
        else
          cell_table<<" "
        end
        # binding.pry
        row_table<<cell_table
      end
      @result_table<<row_table
    end

    # TAO MANG 2 CHIEU
    # mang trong mang
    #   array result chua 16 doi la 16 mang team_battle
    #     moi team_battle chua 1 array A[2] co 15 tran dau
    #     ( * khi click ta goi ajax truyen id va hien thi thong tin tran dau trog bang battle
    #       * khi hien thi ta hien chuoi da ghep vao
    #       voi A[0] la id va A[1] la ti so [ 1, "1-2"]
    #       * update action: thi ta gui id len de update ti so trong table)

  end

  def team_params
    params.require(:team).permit(:name, :short_name, :seed)
  end

end
