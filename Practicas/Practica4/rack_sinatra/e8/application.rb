# class that models a single Hangman game
class HGame

  MAX_ATTEMPTS = 10
  attr_accessor :letters
  attr_accessor :guess
  attr_accessor :attempts

  def initialize(word)

    @letters = word.each_char.inject([]) {|letters, l| letters << l}
    @guess = @letters.map { |letter| letter.tr('A-Za-z', "_")}
    @attempts = 0

  end

  def finished?
    lost? || won?
  end

  def won?
    letters == guess
  end

  def lost?
    attempts == MAX_ATTEMPTS
  end

  def attempt(letter)
    return nil if finished?
    #if letter exists at least once in letters, return true
    if letters.index(letter) != nil
      letters.each_index do | index |
        if letters[index] == letter
          guess[index] = letters[index]
        end
      end
      true
    else
      self.attempts += 1
      false
    end
  end

  def status
    if finished?
      if won?
        return "won"
      else
        return "lost"
      end
    else
      return "still alive!"
    end
  end

  def to_s
    "Status: #{status}\n Guess: #{guess.join(' ')}\n Attempts: #{attempts}\n"
  end
end

# application class, holds aplication logic
class Hangman

  @@games = [
    HGame.new('SARASA'),
    HGame.new('PONCHO CAGON'),
    HGame.new('SUBTRENMETROCLETA'),
    HGame.new('VAMPIDRILO'),
    HGame.new('DAME LOOT')
  ]

  def self.current_games_count
    @@games.size
  end

  def self.getGame(gid)
    @@games[gid]
  end

  def self.getGameStatus(gid)
    getGame(gid).to_s
  end

  def self.attempt(gid,letter)
    @@games[gid].attempt(letter)
  end

end
