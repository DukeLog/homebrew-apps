cask "voicebridge" do
  version "0.6.1"
  sha256 "4c5eae617df69c322b34b8305d3019e73bfee9a9bedc8650a1b027b2f916168d"

  url "https://github.com/DukeLog/homebrew-apps/releases/download/voicebridge-#{version}/VoiceBridge-#{version}.zip"
  name "VoiceBridge"
  desc "On-device push-to-talk dictation and meeting transcription"
  homepage "https://github.com/DukeLog/homebrew-apps"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "VoiceBridge.app"

  # Without this the upgrade replaces the bundle underneath the running process,
  # which then wedges and stops answering even SIGTERM. VoiceBridge lives in the
  # menu bar with no dock icon, so that failure is silent: dictation simply stops.
  uninstall quit: "com.dukelog.voicebridge"

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
    After an upgrade VoiceBridge is quit and not started again — Homebrew never
    relaunches apps. Launch it once from Applications.

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
