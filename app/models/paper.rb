class Paper < ActiveRecord::Base
  belongs_to :project

  attr_accessor :title, :password
  mount_uploader :file, PaperUploader
  before_save :prepare_password

  validates :name, :presence => true, :uniqueness => {:scope => :project_id}
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  def extension; file.url.split('.').last end
  def listing; "#{name} (#{file_url ? file.file.filename : ""})" end

  def authenticate(pass)
    return password_hash == encrypt_password(pass)
  end
  
  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private
    
    def prepare_password
      unless password.blank?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = encrypt_password(password)
      end
    end
end
