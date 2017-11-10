
require "spec_helper"
require 'data_imp/parser/json'

RSpec.describe DataImp::Parser::Json do
  it_behaves_like "parser", "data/heros.json", 9991212
  it_behaves_like "parser", "data/hero.json", 9991212
end

