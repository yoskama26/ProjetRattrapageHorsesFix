class Horse < ApplicationRecord
  belongs_to :stable

  VALID_COLORS = ["Alezan", "Alezan clair", "Alezan brûlé", "Alezan cuivré", "Alezan doré", "Alezan foncé", "Bai", "Bai clair", "Bai cerise", "Bai brun", "Bai foncé", "Noir", "Noir ébène", "Noir pangaré", "Gris", "Gris clair", "Gris pommelé", "Gris truité", "Gris fer", "Gris foncé", "Rouan", "Rouan bleu", "Rouan framboise", "Isabelle", "Isabelle clair", "Isabelle doré", "Palomino", "Palomino clair", "Palomino doré", "Palomino foncé", "Aubère", "Pie", "Pie noir", "Pie bai", "Pie alezan", "Pie isabelle", "Appaloosa", "Appaloosa léopard", "Appaloosa blanket", "Appaloosa snowflake", "Crème", "Crème perlino", "Crème cremello", "Crème champagne", "Souris", "Dun", "Dun clair", "Dun foncé", "Dun rouge", "Champagne", "Champagne classique", "Champagne ambre", "Champagne or", "Champagne crème", "Perlino", "Cremello", "Smoky Black", "Smoky Cream"]

  validates :color, inclusion: { in: VALID_COLORS }


end
