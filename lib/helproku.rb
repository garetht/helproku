require "helproku/version"

module Helproku
  module Generators
    class InitGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def setup_databases
        comment_lines "Gemfile", /sqlite3/
        gsub_file "config/database.yml", 
        /adapter: sqlite3\n\s+database: db\/production.sqlite3/, 
        "adapter: postgresql\n  database: db/production"
      end

      def include_common_gems
        gem_group :development do
          gem 'better_errors'
          gem 'binding_of_caller'
          gem 'sqlite3'
        end
        
        gem_group :development, :test do
          gem "rspec-rails"
        end

        gem_group :production do
          gem 'pg'
        end
      end

      def set_version
        append_to_file "Gemfile", "ruby '1.9.3'", after: "source 'https://rubygems.org'\n"
        inside Rails.root do
          run "bundle install"
        end
      end

      def setup_git
        git :init
        git add: "."
        git commit: "-am 'Pretty awesome first commit!'"
      end

      def get_github_username
        @gituser = ask "Enter your Github username:"
        @project = Rails.application.class.parent_name.downcase
      end

      def upload_git
        run "curl -u '#{@gituser}' https://api.github.com/user/repos -d '{\"name\" : \"#{@project}\"}' "
        git remote: "add origin git@github.com:#{@gituser}/#{@project}.git"
        git push: "-u origin master"
      end

      def setup_heroku
        inside Rails.root do
          run "heroku create"
        end
        git push: "heroku master"
      end
    end

    class DeviseGenerator < Rails::Generators::Base
      # Should include the Devise gem, run install on devise,
      # and generate the views. Also migrate the database.
    end

    class MailGenerator < Rails::Generators::Base
      # Should set up Sendgrid for production and Letter Opener
      # for development.
      # Should also run the correct Heroku command to set up
      # Sendgrid there.
    end

    class PaperclipGenerator < Rails::Generators::Base
      # Should include the paperclip gem, the aws-paperclip gem,
      # and Figaro for AWS.
    end
  end
end
