
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
      when /^HomePage$/ then '/'
      when /([\w\d]+) +PartnershipPage/ then "/partnership/#{$1}"
      when /([\d\-]+) +JobPage/ then "/jobs/#{$1}"
      when /([\d\-]+) +JobEditPage/ then "/jobs/#{$1}/edit"
      when /([\d]+) +JobYearPage/ then "/job_year/#{$1}"
      when /JobStatus Page/ then "/status"
      when /^Job Request/ then "/jobrequest"
      when /^Sign Up/ then "https://bigeventonline.tamu.edu/signup"
      when /^Staff Directory/ then "/users"

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)