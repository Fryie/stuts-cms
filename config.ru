# This file is used by Rack-based servers to start the application.
#require 'rack-tidy-ffi'
#use RackTidyFFI

require ::File.expand_path('../config/environment',  __FILE__)
run Stuts::Application
