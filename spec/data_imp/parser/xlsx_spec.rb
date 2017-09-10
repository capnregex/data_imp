
require "spec_helper"
require 'data_imp/parser/xlsx'

RSpec.describe DataImp::Parser::Xlsx do
  it_behaves_like "parser", "data/heros.xlsx", 9991212
end

