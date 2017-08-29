class Syn < Formula
  desc "Syntax control for the command-line"
  homepage "https://github.com/stephencelis/syn"

  url "https://github.com/stephencelis/syn/archive/v0.2.2.tar.gz"
  sha256 "0f1fe9189104294934f901cadf7a90e03e890f09133b0388ac02e6a3893df223"

  head "https://github.com/stephencelis/syn.git"

  depends_on :xcode
  depends_on :macos => :lion

  # Ensure Makefile doesn't write into /usr/local directly
  patch :DATA

  def install
    system "make", "install", "PREFIX=#{prefix}"

    bin.install "build/usr/local/bin/syn"
    man1.install "build/usr/local/share/man/man1"
  end

  test do
    require "json"
    json_blob = JSON.parse(shell_output(%Q(echo "that's a hell of a hat" | #{bin}/syn --conjunctions -f json)))

    assert_equal json_blob["token"], "that"
  end
end

__END__
diff --git a/Makefile b/Makefile
index 9ec3490..73bb48b 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,9 @@ install: $(COCOAPODS) $(SRC)
 		-workspace syn.xcworkspace \
 		-scheme syn \
 		-sdk macosx \
-		-configuration Release
+		-configuration Release \
+		SYMROOT=$(PWD)/build \
+		DSTROOT=$(PWD)/build

 $(COCOAPODS):
 	@pod install
