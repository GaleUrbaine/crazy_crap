require_relative '../lib/crazy_city'

describe "AJAIN?" do
  it "check if AJAIN is here" do
    expect("AJAIN").to include("AJAIN")
  end
end

describe "CHENIERS?" do
  it "check if COMMENY is here" do
    expect("CHENIERS").to include("CHENIERS")
  end
end

describe "BROUSSE?" do
  it "check if BOUFFEMONT is here" do
    expect("BROUSSE").to include("BROUSSE")
  end
end

describe "mairie.ajain@wanadoo.fr" do
  it "check if mairie.ajain@wanadoo.fr is here" do
    expect("mairie.ajain@wanadoo.fr").to include("mairie.ajain@wanadoo.fr")
  end
end

describe "mairie.cheniers@orange.fr" do
  it "check if mairie.cheniers@orange.fr is here" do
    expect("mairie.cheniers@orange.fr").to include("mairie.cheniers@orange.fr")
  end
end

describe "mairie.brousse@wanadoo.fr" do
  it "check if mairie.brousse@wanadoo.fr is here" do
    expect("mairie.brousse@wanadoo.fr").to include("mairie.brousse@wanadoo.fr")
  end
end
