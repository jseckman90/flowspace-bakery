class Cookie < ActiveRecord::Base
  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true

  def bake_cookie
    
  end

  def ready?
    true
  end
end
