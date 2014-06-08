require 'sinatra'
require 'csv'
require 'pry'
require 'redis'
require 'json'



def read_scores_from(csv)
  @scores = []
  @teams=[]
  tie=false
  w=nil
  l=nil
  found=false


  CSV.foreach(csv, headers: true) do |row|
    score = {
      home_team: row["home_team"],
      away_team: row["away_team"],
      home_score: row["home_score"],
      away_score: row["away_score"],
    }


    @teams.each do |teamarray|
      if teamarray[:team_name]==score[:home_team]
        found=true
      end
    end

    if !found
      team = {
        team_name: score[:home_team],
        wins: 0,
        losses: 0,
        ties: 0
      }
      @teams << team
    end
    found=false

    @teams.each do |teamarray|
      if teamarray[:team_name]==score[:away_team]
        found=true
      end
    end

    if !found
      team = {
        team_name: score[:away_team],
        wins: 0,
        losses: 0,
        ties:0
      }
      @teams << team
    end
    found=false
    @scores << score
  end

  @scores.each do |score|
    if score[:home_score].to_i > score[:away_score].to_i
      winner=score[:home_team]
      loser=score[:away_team]
    else
      if score[:home_score].to_i < score[:away_score].to_i
        winner=score[:away_team]
        loser=score[:home_team]
      else
        if score[:home_score].to_i == score[:away_score].to_i
          winner=score[:away_team]
          loser=score[:home_team]
          tie=true
        end
      end
    end

    @teams.each do |team|
      if team[:team_name]==winner
        if tie
          t=team[:ties]+1
          team[:ties]=t
          tie=false
        else
          w=team[:wins]+1
          team[:wins]=w
        end
      else
        if team[:team_name]==loser
          if tie
            t=team[:ties]+1
            team[:ties]=t
            tie=false
          else
            l=team[:losses]+1
            team[:losses]=l
          end
        end
      end
    end
  end
end



get '/leaderboard' do
  read_scores_from('scores.csv')
  @data = @teams.sort_by { |hsh| [hsh[:wins].to_s, hsh[:losses].to_s] }.reverse!
  erb :index
end


get '/teams/:team_name' do
  read_scores_from('scores.csv')
  @hometeams=[]
  @awayteams=[]
  @teams.each do |team|
    if team[:team_name] == params[:team_name]
      @team = team
      @scores.each do |score|
        if score[:home_team] == team[:team_name]
          home={

            homeopponent: score[:home_team],
            awayopponent: score[:away_team],
            homescore: score[:home_score],
            awayscore: score[:away_score]
          }

          @hometeams << home

        else
          if score[:away_team] == team[:team_name]

            away={
              homeopponent: score[:home_team],
              awayopponent: score[:away_team],
              homescore: score[:home_score],
              awayscore: score[:away_score]
            }

            @awayteams << away

          end
        end
      end
    end
  end
  erb :show
end


