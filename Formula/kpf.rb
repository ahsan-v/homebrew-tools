class Kpf < Formula
  desc "Kubectl port-forward manager with stable local ports"
  homepage "https://github.com/ahsan-v/kpf"
  url "https://github.com/ahsan-v/kpf/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_AFTER_RELEASE"
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
