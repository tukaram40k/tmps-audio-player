export interface Track {
  id: number;
  filename: string;
  file_format: string;
  title: string;
  artist: string;
  url: string;
  producer: string;
  album: string;
  release_date: string;
  lyrics: string;
  isPremium?: boolean;
}

export interface User {
  isPremium: boolean;
}

export class ProxyTrack implements Track {
  private real: Track;
  private user: User;

  constructor(real: Track, user: User) {
    this.real = real;
    this.user = user;
  }

  get id() { return this.real.id; }
  get filename() { return this.real.filename; }
  get file_format() { return this.real.file_format; }
  get title() { return this.real.title; }
  get artist() { return this.real.artist; }
  get producer() { return this.real.producer; }
  get album() { return this.real.album; }
  get release_date() { return this.real.release_date; }
  get lyrics() { return this.real.lyrics; }
  get isPremium() { return this.real.isPremium; }

  get url() {
    if (this.real.isPremium && !this.user.isPremium) {
      return "/audio_files/slow_dance.mp3";
    }
    return this.real.url;
  }
}
