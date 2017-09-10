
require "spec_helper"
require 'data_imp/parser/xls'

RSpec.describe DataImp::Parser::Xls do
  it_behaves_like "parser", "data/heros.xls", 9991212
end

