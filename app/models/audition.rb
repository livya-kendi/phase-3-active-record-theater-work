class Audition < ActiveRecord::Base
  belongs_to :role
  has_many :actors

  def self.role 
    Role.find do |role|
      role.id == self.role_id
    end
  end

  def call_back
    self.update(hired: true)
  end
end