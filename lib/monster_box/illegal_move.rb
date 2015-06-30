module MonsterBox
  class IllegalMove < StandardError
    GUARD_ERROR = 'You must attack the monster with guard'
  end
end
