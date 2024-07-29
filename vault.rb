class Vault
  attr_accessor :vault_db

  # initia
  def initialize(dbPath)
    @vault_db = dbPath;
  end
end


new_vault = Vault.new("/db.sqlite3")

puts new_vault.vault_db
