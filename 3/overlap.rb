require_relative 'cloth'

def overlap claims
  cloth = Cloth.new

  claims.each do |claim|
    cloth.claim claim
  end

  cloth.overlap
end

