class HerosImporter < DataImp::Porter
  def import
    unless name == "George"
      raise "Name #{name.inspect} does not match"
    end
    unless rank == "Sargent"
      raise "Name #{rank.inspect} does not match"
    end
    unless serial_number.to_i == 9991212
      raise "Name #{serial_number.inspect} does not match"
    end
  end
  def on_error e
    puts self.inspect
    raise e
  end
end

class HeroImporter < HerosImporter
end
