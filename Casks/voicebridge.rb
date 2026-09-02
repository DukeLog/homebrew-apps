cask "voicebridge" do
  version "0.5.0"
  sha256 "b938de712e952821846814177d2bdb6424d6557fcc5bbaf1d7babe1069e69cdf"

  url "https://github.com/DukeLog/homebrew-apps/releases/download/voicebridge-#{version}/VoiceBridge-#{version}.zip"
  name "VoiceBridge"
  desc "On-device push-to-talk dictation and meeting transcription"
  homepage "https://github.com/DukeLog/homebrew-apps"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "VoiceBridge.app"

  zap trash: [
    "~/.cache/voice-bridge",
    "~/Library/Application Support/VoiceBridge",
    "~/Library/Preferences/com.dukelog.voicebridge.plist",
  ]

  caveats <<~EOS
    On first launch VoiceBridge opens its settings and installs a private Python
    environment plus the recognition model (~1.5 GB, downloaded once from
    Hugging Face). It will ask for two permissions:
      - Microphone      (to hear you)
      - Accessibility   (to paste the recognized text)
    Then hold fn anywhere, speak, release.

    Meetings: ctrl-option-cmd-M records a call (your microphone plus what you
    hear) and transcribes it on-device; the first recording asks for one more
    permission, System Audio Recording.

    Downloaded models live in ~/.cache/huggingface and are shared with other
    tools; uninstalling the cask does not remove them.
  EOS
end
