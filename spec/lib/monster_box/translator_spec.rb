require_relative '../../../lib/monster_box'

describe MonsterBox::Translator do
  context '#execute' do
    let(:game) { double(:game) }
    let(:player_id) { 0 }
    let(:pass_turn_move) { MonsterBox::Move.new(player_id, :pass_turn) }

    it 'executes a pass turn move' do
      translator = MonsterBox::Translator.new(game)
      game.should_receive(:pass_turn).with(player_id)
      translator.execute(pass_turn_move)
    end
  end
end
