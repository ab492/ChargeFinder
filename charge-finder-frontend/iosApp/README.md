# Charge Finder iOS

## Project Setup
1. Install Homebrew and run `brew bundle install` from the project directory to install packages from the Brewfile.
2. Run `mint bootstrap` to fetch all dependencies from the Mintfile. This won't link them globally; you can use `mint bootstrap --link` if that's required.
3. You'll need to use `mint run somePackage` to run the specified version (unless you've linked Mint version globally).