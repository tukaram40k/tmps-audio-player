import type { Track } from '../TrackList.tsx'

export interface AudioAdapter {
  getUrl(): string
}

class Mp3Adapter implements AudioAdapter {
  private track: Track

  constructor(track: Track) {
    this.track = track
  }

  getUrl() {
    return this.track.url
  }
}

class WavAdapter implements AudioAdapter {
  private track: Track

  constructor(track: Track) {
    this.track = track
  }

  getUrl() {
    return this.track.url
  }
}

class FlacAdapter implements AudioAdapter {
  private track: Track

  constructor(track: Track) {
    this.track = track
  }

  getUrl() {
    return this.track.url
  }
}

export function createAudioAdapter(track: Track): AudioAdapter {
  const filename = track.url.split('.').pop()?.toLowerCase()

  switch (filename) {
    case 'mp3': return new Mp3Adapter(track)
    case 'wav': return new WavAdapter(track)
    case 'flac': return new FlacAdapter(track)
    default:
      throw new Error(`Unsupported format: ${filename}`)
  }
}
