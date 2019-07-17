class Song < ApplicationRecor
  
validates :title,  presence: true 
validates :title, uniqueness: {:scope => [:release_year,:artist_name],  message: "Title cannot be repeated within the year for the same artist."} 
validates :released, inclusion: {in: [true, false]} 
validates :release_year, presence: true,  if :released 
validates :genre, presence: true 
validates :artist_name, presence: true 
validate :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if :released 



end
