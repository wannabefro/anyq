class Anonymizer
  ADJECTIVES = [
    "boiling", "hidden", "bitter", "misty", "loquacious", "empty", "dry", "dark",
    "rick-rolled", "icy", "cryptic", "quiet", "caffeinated", "cool", "radiant", "electric",
    "patient", "superfluous", "dawn", "crimson", "furious", "fresh", "blue",
    "billowing", "broken", "pumpkin", "bearded", "falling", "frosty", "green",
    "long", "late", "lingering", "bold", "little", "morning", "glorious", "blazing",
    "red", "rough", "feisty", "delicious", "sparkling", "throbbing", "shy",
    "wandering", "emo", "wild", "black", "screaming", "falling", "solitary",
    "fragrant", "shielded", "snowy", "proud", "agile", "twerking", "thirsty",
    "Vulcan", "ancient", "green", "lively", "nameless"
  ].freeze

  NOUNS = [
    "waterfall", "river", "donuts", "ninja", "wizard", "rain", "Adam's-Beard", "astronaut",
    "Weasley", "yeti", "sunset", "pine", "shadow", "leaf", "dawn", "shoes", "tribble",
    "forest", "harbor", "cloud", "jedi", "sandwich", "glade", "eagles", "brook",
    "butterfly", "ocean", "dew", "kitten", "dumpling", "fire", "launcher", "firefly",
    "sweet-potato", "REDBULL", "haze", "mountain", "night", "elf", "darkness",
    "fjord", "silence", "reef", "hobbit", "shape", "surf", "thunder",
    "citadel", "water", "shwag", "dragon", "water", "resonance", "sword",
    "wood", "bayou", "cherry", "tree", "MajorTom", "frost", "crocodile", "octocat",
    "frog", "fox", "canyon"
  ].freeze

  MAX_NUMBER = 10_000

  def initialize(adjective_list = ADJECTIVES, noun_list = NOUNS, random_number = MAX_NUMBER)
    @adjective_list = adjective_list
    @noun_list = noun_list
    @random_number = random_number
  end

  def generate_alias
    [random_adjective, random_noun, random_number].join '-'
  end

  private

  def random_adjective
    @adjective_list.sample
  end

  def random_noun
    @noun_list.sample
  end

  def random_number
    "%04d" % rand(@random_number)
  end 
end
