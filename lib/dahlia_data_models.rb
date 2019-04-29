require "dahlia_data_models/version"

module DahliaDataModels
  class Error < StandardError; end
  # Your code goes here...

  class Engine < ::Rails::Engine
    config.eager_load_paths += [
      File.expand_path("dahlia_data_models/models", __dir__),
      File.expand_path("dahlia_data_models/services", __dir__),
    ]
  end
end
