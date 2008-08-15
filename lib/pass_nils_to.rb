module PassNils  
  def pass_nils_to(method_sym, object = self)
    method = object.method(method_sym.to_s)
    
    method.arity.times do |i|
      nils = Array.new(method.arity) { nil }
      nils[i] = "foo"
      method.call(*nils)
    end
    
    if method.arity > 2
      method.arity.times do |i|
        nils = Array.new(method.arity) { nil }
        (method.arity - 1).times { |j| nils[i-j] = "foo" }
        method.call(*nils)
      end
    end
    
    nils = Array.new(method.arity) { nil }
    method.call(*nils)   # Call with all nils
  end
end