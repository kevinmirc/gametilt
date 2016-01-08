class CreateInvitationsJoinTable < ActiveRecord::Migration
  def change
    create_join_table(:players, :games, table_name: :invitations)
  end
end
