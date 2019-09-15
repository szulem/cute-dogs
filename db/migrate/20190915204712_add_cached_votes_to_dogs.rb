class AddCachedVotesToDogs < ActiveRecord::Migration[5.2]
  def self.up
    add_column :dogs, :cached_votes_total, :integer, :default => 0
    add_column :dogs, :cached_votes_score, :integer, :default => 0
    add_column :dogs, :cached_votes_up, :integer, :default => 0
    add_column :dogs, :cached_votes_down, :integer, :default => 0
    add_index  :dogs, :cached_votes_total
    add_index  :dogs, :cached_votes_score
    add_index  :dogs, :cached_votes_up
    add_index  :dogs, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Dog.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :dogs, :cached_votes_total
    remove_column :dogs, :cached_votes_score
    remove_column :dogs, :cached_votes_up
    remove_column :dogs, :cached_votes_down
  end
end
