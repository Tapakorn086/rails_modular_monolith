require "blorgh/version"
require "blorgh/engine"
require "importmap-rails"

module Blorgh
  class << self
    attr_accessor :configuration
  end

  class Configuration
    attr_reader :importmap

    def initialize
      @importmap = Importmap::Map.new
      @importmap.draw(Blorgh::Engine.root.join("config/importmap.rb"))
    end
  end

  def self.init_config
    self.configuration ||= Configuration.new
  end
end

Blorgh.init_config
