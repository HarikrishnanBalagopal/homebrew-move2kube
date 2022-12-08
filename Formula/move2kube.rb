class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.5",
      revision: "6af1220e009c7548905fd8d9a6896a6175451512"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.5"
    sha256 cellar: :any_skip_relocation, monterey:     "76011951a2ae586868993a0be7ffbcde9e0848d903ac3376a0c5983c963cbce5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8efd31fb7a8907fdf6fa580bbc23f7a7638cb5e0deb22874ba1fe581bc53644d"
  end

  depends_on "go@1.18" => :build
  depends_on "buildpacks/tap/pack" => :optional
  depends_on "docker" => :optional
  depends_on "helm" => :optional
  depends_on "kubernetes-cli" => :optional
  depends_on "operator-sdk" => :optional

  def install
    system "make", "build"
    bin.install "bin/move2kube"
  end

  test do
    # test the version
    want = "v" + version
    assert_equal want, shell_output("#{bin}/move2kube version").strip
  end
end
