require 'spec_helper'
require 'game_of_life'

describe GameOfLife::Game do
  before(:all) do
    # testing data:
    # http://fr.wikipedia.org/wiki/Fichier:Gospers_glider_gun.gif
    # http://commons.wikimedia.org/wiki/File:Game_of_life_glider_gun.png
    @starting_board  = "                        x           \n"
    @starting_board += "                      x x           \n"
    @starting_board += "            xx      xx            xx\n"
    @starting_board += "           x   x    xx            xx\n"
    @starting_board += "xx        x     x   xx              \n"
    @starting_board += "xx        x   x xx    x x           \n"
    @starting_board += "          x     x       x           \n"
    @starting_board += "           x   x                    \n"
    @starting_board += "            xx                      \n"
    @starting_board += "                                    \n" * 27

    @after_one_board  = nil

    @after_five_board = nil
  end

  before(:each) do
    @game = GameOfLife::Game.new(@starting_board)
  end

  it 'should be initialized without arguments' do
    lambda { GameOfLife::Game.new }.should_not raise_error
  end

  it 'should be initialized with arguments' do
    lambda { GameOfLife::Game.new(@starting_board) }.should_not raise_error
  end

  it 'should respond to board' do
    @game.should respond_to(:board)
  end

  it '#board should return starting board after initializazion' do
    @game = GameOfLife::Game.new(@starting_board)
    @game.board.should == @starting_board
  end

  it 'should respond to run' do
    @game.should respond_to(:run)
  end

  it '#run should accept no argument' do
    lambda { @game.run }.should_not raise_error
  end

  it '#run should accept a numeric argument' do
    lambda { @game.run(5) }.should_not raise_error
  end

  it 'should run game for one round' do
    @game.run
    @game.board == @after_one_board
  end

  it 'should run game for five round' do
    @game.run(5)
    @game.board == @after_five_board
  end

  it 'should print board' do
    @game.board.to_s.should == @starting_board
  end
end
