require "spec_helper"
require 'data_imp/parser/ods'

RSpec.describe DataImp::Parser::Ods do
  it_behaves_like "parser", "data/heros.ods", 9991212
end

