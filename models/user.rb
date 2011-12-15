class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String,     :required => true,
                                    :unique => true
  property :password,   BCryptHash, :required => true
  property :first_name, String,     :required => true
  property :last_name,  String,     :required => true
  property :email,      String,     :required => false,
                                    :unique => true,
                                    :format => RFC822::EmailAddress,
                                    :messages => {
                                      :is_unique => 'We already have that email.',
                                      :format    => 'Please enter a valid email address.'
                                    }
  timestamps :at

  def name
    "#{self.first_name} #{self.last_name[0..0]}"
  end
end
