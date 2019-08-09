# Classname should match the name of the installed package.
class Gohangman < Formula
    desc "Hangman is a game created using Go Lang."
    homepage "https://github.com/kumarsparkz/go-hangman"
    version "0.1.2"

    # Source code archive. Each tagged release will have one
    url "https://github.com/kumarsparkz/go-hangman/archive/{version}.tar.gz"
    sha256 "f5ac2ba0dfc711d5b6c9121c6c51f11cc692c94d"
    
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
