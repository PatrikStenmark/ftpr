require 'ffi'
module Ftpr::CurlEasy
  extend FFI::Library

  ffi_lib ['/usr/lib/libcurl.dylib']

  attach_function :init, :curl_easy_init, [], :pointer

  attach_function :setopt, :curl_easy_setopt, [:pointer, :int, :pointer], :pointer
  attach_function :setopt_long, :curl_easy_setopt, [:pointer, :int, :long], :pointer

  attach_function :perform, :curl_easy_perform, [:pointer], :int
  attach_function :cleanup, :curl_easy_cleanup, [:pointer], :void

  # TODO move to Curl namespace, not CurlEasy
  attach_function :global_init, :curl_global_init, [:long], :pointer
  attach_function :global_cleanup, :curl_global_cleanup, [], :void

  module Options
    OBJECT_POINTER = 10000
    FUNCTION_POINTER = 20000

    CURLOPT_URL = OBJECT_POINTER + 2
    CURLOPT_WRITEFUNCTION = FUNCTION_POINTER + 11

    CURLOPT_VERBOSE = 41


    CURL_GLOBAL_SSL = (1<<0)
    CURL_GLOBAL_WIN32 = (1<<1)
    CURL_GLOBAL_ALL = (CURL_GLOBAL_SSL|CURL_GLOBAL_WIN32)
    CURL_GLOBAL_NOTHING = 0
    CURL_GLOBAL_DEFAULT = CURL_GLOBAL_ALL
    
  end
end
