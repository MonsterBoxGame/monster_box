require_relative '../../../lib/monster_box'

describe MonsterBox::Game do
  context '#pass_turn' do
    let(:first_player) { double(:first_player) }
    let(:second_player) { double(:second_player) }
    let(:game) { MonsterBox::Game.new(first_player, second_player, nil) }

    it 'first player passes turn' do
      first_player.should_receive(:pass_turn)
      game.pass_turn(0)
    end

    it 'second player passes turn' do
      second_player.should_receive(:pass_turn)
      game.pass_turn(1)
    end

    it 'raises error for unknown player ids' do
      expect { game.pass_turn(2) }.to raise_error MonsterBox::IllegalMove
    end
  end
end
