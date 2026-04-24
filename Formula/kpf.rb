class Kpf < Formula
  desc "Kubectl port-forward manager with stable local ports"
  homepage "https://github.com/ahsan-v/kpf"
  url "https://github.com/ahsan-v/kpf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e5ac47084c0f2a52205b244b94f35d230d334eec81b253e8d8727cc6e9cbc553"
  license "MIT"

  depends_on "jq"

  def install
    bin.install "bin/kpf"
    (share/"kpf").install "services.json.example"
  end

  def caveats
    <<~EOS
      kpf requires kubectl on your PATH (brew install kubernetes-cli).

      Copy the example config to get started:
        mkdir -p ~/.config/kpf
        cp -n #{opt_share}/kpf/services.json.example ~/.config/kpf/services.json
        "${EDITOR:-vi}" ~/.config/kpf/services.json

      Then:
        kpf list
        kpf up <alias>
    EOS
  end

  test do
    assert_match "kpf", shell_output("#{bin}/kpf help")
  end
end
