require 'spec_helper'
require 'mayatointeger'

class Test
  include MayaToInteger
end

describe MayaToInteger do
  subject { Test.new }

  describe '#convert' do
    it 'should compoud circle to 1' do
      result = subject.maya_to_integer("ooo")
      expect(result).to eq(3)
    end

    it 'should compoud bar to 5' do
      result = subject.maya_to_integer("-----")
      expect(result).to eq(5)
    end

    it 'should manage endline' do
      result = subject.maya_to_integer("-----\n-----\n")
      expect(result).to eq(10)
    end

    it 'should manage floors' do
      result = subject.maya_to_integer("o\n\no\n-----\n-----\n")
      expect(result).to eq(31)
    end

    it 'should be able to calcul big number' do
      result = subject.maya_to_integer("oo\n\noooo\n-----\n\no\n-----\n\noooo\n-----\n-----")
      expect(result).to eq(19734)
    end

    it 'should be able to manage 0 (as <(((>)' do
      result = subject.maya_to_integer("o\n\n<(((>\n\n<(((>")
      expect(result).to eq(400)
    end

    it 'should be able to distinguish bar by \n' do
      result = subject.maya_to_integer("\n---\n--")
      expect(result).to eq(10)
    end
  end
end
