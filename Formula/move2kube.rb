class Move2kube < Formula
  desc "Command-line tool that accelerates migration of your app to Kubernetes/Openshift"
  homepage "https://move2kube.konveyor.io/"
  license "Apache-2.0"
  head "https://github.com/konveyor/move2kube.git"

  stable do
    url "https://github.com/konveyor/move2kube.git",
      using:    :git,
      tag:      "v0.3.10",
      revision: "1862c9c951d760a9f3e8504abb0d25161c7b541c"
  end

  bottle do
    root_url "https://github.com/konveyor/homebrew-move2kube/releases/download/v0.3.10"
    sha256 cellar: :any_skip_relocation, monterey:     "3ea4fb88ccdb19cf2e7d2c2db455fc94ab77a613e27da7a129abcdb02a0b9f0c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "068496517ff0aa6855c8f45d3a24dea0fb2c25c25c35c79c258700e503150e2b"
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
