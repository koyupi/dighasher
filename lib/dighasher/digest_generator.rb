require 'digest/md5'
require 'digest/sha1'
require 'digest/sha2'

# Dighasher module.
module Dighasher

  # Digest Instance Generator
  class DigestGenerator

    # MD5 Hash Constant
    MD5 = 1
    # SHA1 Hash Constant
    SHA1 = 2
    # SHA256 Hash Constant
    SHA256 = 3
    # SHA512 Hash Constant
    SHA512 = 4
    # SHA2 Hash Constant
    SHA2 = 5

    # get available hash.
    def self.available
      "Digest::MD5, Digest::SHA1, Digest::SHA2(256, 384, 512)"
    end

    # generate digest instance.
    # @param [integer] mode Hash mode. use DigestGenerator constant.
    # @param [String] str target string
    # @param [integer] bitlen SHA2 bitlength. 256 or 384 or 512.
    # @return [Digest] digest lib instance
    def self.generate_digest(mode, str=nil, bitlen=256)

      digest = nil

      # generate digest instance
      case mode
      when MD5 then
        digest = Digest::MD5.new
      when SHA1 then
        digest = Digest::SHA1.new
      when SHA256, SHA512, SHA2 then
        digest = Digest::SHA2.new(bitlen)
      else
        # raise error.
        raise TypeError.new("invalid mode : #{mode}")
      end

      # set str
      if (digest && str)
        digest.update(str)
      end
      digest
    end
  end
end