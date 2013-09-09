class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friends
  has_and_belongs_to_many :collections
  #has_and_belongs_to_many :records, :through => :collections
  #accepts_nested_atrributes_for :users

end
