class Importer::Base < Importer::Row
  def self.before_all_imports
  end

  def before_import
  end

  def import
  end

  def after_import
  end

  def self.after_all_imports
  end
end
