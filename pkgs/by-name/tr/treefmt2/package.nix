{ lib, buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "treefmt";
  version = "2.0.2";

  src = fetchFromGitHub {
    owner = "numtide";
    repo = "treefmt";
    rev = "v${version}";
    hash = "sha256-059lZJ68jGJQYYNqVXetntPrquMY7BZrYHNdL5jmq3M=";
  };

  vendorHash = "sha256-rjdGNfR2DpLZCzL/+3xiZ7gGDd4bPyBT5qMCO+NyWbg=";

  subPackages = [ "." ];

  CGO_ENABLED = 1;

  ldflags = [
    "-s"
    "-w"
    "-X git.numtide.com/numtide/treefmt/build.Name=${pname}"
    "-X git.numtide.com/numtide/treefmt/build.Version=v${version}"
  ];

  meta = {
    description = "one CLI to format the code tree";
    homepage = "https://github.com/numtide/treefmt";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.brianmcgee lib.maintainers.zimbatm ];
    mainProgram = "treefmt";
  };
}
