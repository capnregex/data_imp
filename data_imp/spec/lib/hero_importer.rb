class HerosImporter < DataImp::Porter
  def import
    raise "Name #{name.inspect} does not match" unless %w[George Sam].include?(name)
    raise "Rank #{rank.inspect} does not match" unless %w[Sargent Private].include?(rank)
    return if [9_991_212, 1_234_567].include?(serial_number.to_i)

    raise "Serial number #{serial_number.inspect} does not match"
  end

  def on_error(e)
    puts inspect
    raise e
  end
end

class HeroImporter < HerosImporter
end
