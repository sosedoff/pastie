module Pastie
  module Share
    # Email configuration file location
    def email_file
      "#{ENV['HOME']}/.pastie_email"
    end
    
    # Load configuration
    def email_config
      YAML.load(File.read(email_file))
    end
    
    # Configure local email sharer
    def configure_email
      config = {
        :username => ask('Gmail', :required => true),
        :password => ask('Password', :required => true)
      }
      File.open(email_file, 'w') { |f| f.write(YAML.dump(config)) }
    end
    
    # Share link
    def share(links, email)
      unless File.exists?(email_file)
        configure_email
      end
      
      config = email_config
      
      begin
        Pony.mail(
          :from    => config[:username],
          :to      => email,
          :subject => "Pastie.org - New paste!",
          :body    => links.join("\r\n"),
          :via     => :smtp,
          :via_options => {
            :address              => 'smtp.gmail.com',
            :port                 => '587',
            :enable_starttls_auto => true,
            :user_name            => config[:username],
            :password             => config[:password],
            :authentication       => :plain,
            :domain               => "localhost.localdomain"
          }
        )
      rescue Net::SMTPAuthenticationError
        puts "Invalid username or password!".red
      rescue Exception => ex
        puts "Uncaught exception: #{ex.inspect}".red
      end
    end
  end
end