cask "voicebridge" do
  version "0.4"
  sha256 "6d0261d816af58283905efb33efb8605a63f0a88f93a8b340096be7117041c8b"

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
