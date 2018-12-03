require_relative 'cloth'

def non_overlap claims
  cloth = Cloth.new

  claims.each do |claim|
    cloth.claim claim
  end

  cloth.non_overlap.first.id
end
