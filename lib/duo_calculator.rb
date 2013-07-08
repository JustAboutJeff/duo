class DuoCalculator
  def initialize(user)
    @user = user
  end

  # To improve this method I need to select from the available team
  # members only those users who have not yet been assigned a partner.
  def get_partner
    partner = self.get_team_members.sample
    @user.set_partner(partner)
    partner
  end

  # I know there is a more 'railsy' way to accomplish this db query. Something like:
  # team_ids = TeamMember.where(user_id: @user.id).pluck(:team_id)
  # user_ids = TeamMember.where(team_id: team_ids).pluck(:user_id)
  # User.where(id: user_ids, "id NOT #{@user.id}") ? not sure if that's correct syntactically
  def get_team_members
    team_ids = "SELECT team_id FROM team_members WHERE team_members.user_id = #{@user.id}"
    user_ids = "SELECT user_id FROM team_members WHERE team_members.team_id IN (#{team_ids})"
    User.where("users.id IN (#{user_ids}) AND users.id != #{@user.id}")
  end

  # This method isn't ideal. It has the issue that for odd numbered teams the last user will
  # not recieve a pairing assignment. However, the loop will kick out and prevent an infinite run.
  def self.get_duos
    users = User.all
    while users.count > 0
      user = users.pop
      myCalc = DuoCalculator.new(user)
      partner = myCalc.get_partner
      users.delete(partner)
      DuoMailer.duo_notify(user).deliver
      DuoMailer.duo_notify(partner).deliver
    end
  end
end
