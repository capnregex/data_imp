class DatabasesImporter < DataImp::Importer
  def self.before_all_imports
    @@names = []
  end
  def import
    @@names.push name
  end
  def self.after_all_imports
    @@names.sort!
  end
  def self.names
    @@names ||= []
  end
end

class DatabaseImporter < DatabasesImporter
end

