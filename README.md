# VoiceBridge

Push-to-talk dictation for macOS. Hold a key anywhere, speak, release — the recognized
text is pasted right where your cursor is. Recognition runs **fully on-device**
(mlx-whisper on the GPU via Metal): no audio ever leaves your Mac.

Russian dictation runs two engines side by side — whisper plus Sber's GigaAM v3, with
the results merged word by word: GigaAM hears Russian better, whisper keeps the latin
tech terms. English and Spanish are supported too.

## Install

```sh
brew install --cask dukelog/voicebridge/voicebridge
```

Requirements: Apple Silicon, macOS 14 (Sonoma) or newer.

On first launch the app opens its settings and installs what it needs: a private Python
environment and the recognition model (~1.5 GB, downloaded once). Grant it two
permissions when asked — **Microphone** (to hear you) and **Accessibility** (to paste
the text). Then hold `fn`, speak, release.

## Features

- Push-to-talk from any app: hold `fn` (configurable), speak, release — text lands at
  your cursor.
- Hands-free mode: double-tap to start, single press to stop.
- A personal replacement dictionary that fixes recognition slips (⌃⌥⌘V on a selection
  teaches it a new rule in place).
- History of everything dictated, with search and an audio archive — a dictation that
  failed to recognize keeps its recording, your speech is never lost.
- Long recordings are chunked at natural pauses, so hour-long dictations work.
- Dictation speed statistics.

## Privacy

Everything is local: recognition, history, audio archive. The app makes network
requests only to download models from Hugging Face.

## Updates

```sh
brew upgrade --cask voicebridge
```

---

# VoiceBridge (по-русски)

Системная push-to-talk диктовка для macOS: зажал клавишу в любом приложении →
говоришь → отпустил → текст вставлен туда, где стоял курсор. Распознавание полностью
локальное (mlx-whisper на Metal), звук с компьютера никуда не уходит. Русская диктовка
идёт двумя движками (whisper + GigaAM v3 от Сбера) со сшивкой результатов: GigaAM
лучше слышит русский, whisper удерживает латинские термины.

Установка: команда `brew install` выше. Требования: Apple Silicon, macOS 14+.
При первом запуске приложение само ставит окружение и модель (~1,5 ГБ, один раз)
и попросит два разрешения: Микрофон и Универсальный доступ (для вставки текста).
Дальше — зажать `fn` и говорить.
