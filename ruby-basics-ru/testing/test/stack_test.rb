# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  def test_empty
    stack = Stack.new([])
    assert(stack.empty? == true)
  end

  def test_pop
    stack = Stack.new([1, 2])
    stack.pop!
    assert(stack.size == 1)
  end

  def test_push
    stack = Stack.new([])
    stack.push!(1)
    assert(stack.size == 1)
  end

  def test_clear
    stack = Stack.new([1, 2])
    stack.clear!
    assert(stack.empty? == true)
  end
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
