cask "voicebridge" do
  version "0.3"
  sha256 "3c0ed6944fafefb9b40051e2bb56652c2d5fa958bb7e1380f07cd9a0fc40cfb1"

  url "https://github.com/DukeLog/homebrew-apps/releases/download/voicebridge-#{version}/VoiceBridge-#{version}.zip"
  name "VoiceBridge"
  desc "Push-to-talk dictation with fully on-device speech recognition"
  homepage "https://github.com/DukeLog/homebrew-apps"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "VoiceBridge.app"

  zap trash: [
    "~/Library/Application Support/VoiceBridge",
    "~/.cache/voice-bridge",
    "~/Library/Preferences/com.dukelog.voicebridge.plist",
  ]

  caveats <<~EOS
    On first launch VoiceBridge opens its settings and installs a private Python
    environment plus the recognition model (~1.5 GB, downloaded once from
    Hugging Face). It will ask for two permissions:
      - Microphone      (to hear you)
      - Accessibility   (to paste the recognized text)
    Then hold fn anywhere, speak, release.

    Downloaded models live in ~/.cache/huggingface and are shared with other
    tools; uninstalling the cask does not remove them.
  EOS
end
