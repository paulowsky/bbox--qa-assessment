Dir[File.join(File.dirname(__FILE__), 'services/*.rb')]
  .sort.each { |file| require file }

module Services
  class ApiServices
    class << self
      def users
        Services::Users.new
      end
    end
  end
end
