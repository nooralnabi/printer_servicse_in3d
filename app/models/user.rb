class User < ActiveRecord::Base
   has_many :services
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
        validates :first_name , :presence => true      
        validates :last_name , :presence => true 
       validates_format_of :email, :with => /\A([^@\s]+)@((gmail)\.+com)\Z/i, :on => :create ,:message =>"must be in @gmail.com"
end
