require "spec_helper"
require 'data_imp/parser/csv'

RSpec.describe DataImp::Parser::Csv do
  it_behaves_like "parser", "data/heros.csv", "9991212"
end

