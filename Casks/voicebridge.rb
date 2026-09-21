cask "voicebridge" do
  version "0.6.0"
  sha256 "526b08b709766fb02949de822451674c3d4de05eaff3dfd2720c15d8a87821bc"

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
    Then hold fn anywhere, speak, release. While you hold it, a panel above
    everything shows a rough draft of what you are saying, so you can tell the
    microphone is hearing you; drag it anywhere, or switch it off in Settings.
    The pasted text is the full-quality recognition, not that draft.

    Meetings: ctrl-option-cmd-M records a call (your microphone plus what you
    hear) and transcribes it on-device; the first recording asks for one more
    permission, System Audio Recording.

    Downloaded models live in ~/.cache/huggingface and are shared with other
    tools; uninstalling the cask does not remove them.
  EOS
end
