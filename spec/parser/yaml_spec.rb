require "spec_helper"
require 'data_imp/parser/yaml'

RSpec.describe DataImp::Parser::Yaml do
  it_behaves_like "parser", "data/heros.yaml", 9991212
  it_behaves_like "parser", "data/hero.yaml", 9991212
end

