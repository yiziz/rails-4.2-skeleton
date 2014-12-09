module IdNameExt

  define_method 'module_name' do
    self.name[5..-1].downcase
  end

  define_method 'class_name' do
    module_name.capitalize
  end

  define_method 'add_id_name_methods' do
    klass = class_name.constantize
    attr_id = "#{module_name}_id"
    attr_id_sym = attr_id.to_sym
    klass.name_hash.keys.each do |name|
      define_method "#{name}?" do
        self.send(attr_id) == klass.name_to_id(name)
      end

      define_method "#{name}!" do
        self.send("#{attr_id}=", klass.name_to_id(name))
      end
    end

    define_method "#{module_name}_name=" do |s|
      return write_attribute attr_id_sym, s if s.nil?
      return write_attribute attr_id_sym, klass.name_to_id(s.downcase)
    end

    define_method "#{module_name}_name" do
      return klass.id_to_name(self.send(attr_id))
    end
  end

end
