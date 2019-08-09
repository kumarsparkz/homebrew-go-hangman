# Classname should match the name of the installed package.
class go-hangman < Formula
    desc "Hangman is a game created using Go Lang."
    homepage "https://github.com/kumarsparkz/go-hangman"
    version "0.1.0"
    
    # Source code archive. Each tagged release will have one
    url "https://github.com/kumarsparkz/go-hangman/archive/{version}.tar.gz"
    sha256 "3d08578bafcbdc1eb582b117a9830ca68b686f28"
    
    depends_on "go" => :build
    
  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/kumarsparkz/go-hangman"
    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/kumarsparkz/go-hangman
    bin_path.install Dir["*"]
    cd bin_path do
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
      system "go", "build", "-o", bin/"go-hangman", "."
    end
  end
  
