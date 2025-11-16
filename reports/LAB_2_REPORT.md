## Creational Design Patterns

***

### Course: TMPS

### Author: Rudenco Ivan

***

### Objectives:

* Study and understand the Structural Design Patterns;
* As a continuation of the previous laboratory work, think about the functionalities that your system will need to provide to the user;
* Implement some additional functionalities using structural design patterns;


### Used Design Patterns:

* Facade - a structural design pattern that provides a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level interface that makes the subsystem easier to use.
* Adapter - a structural design pattern that converts the interface of a class into another interface clients expect. Adapter lets classes work together that couldn't otherwise because of incompatible interfaces.
* Proxy - a structural design pattern that provides a surrogate or placeholder for another object to control access to it.

### Implementation

I continued working on the audio player application from lab 1 and used structural patterns to extend its functionality.

#### Facade
Classes `TrackInitializer` and `PlaylistInitializer` are facades. They abstract several object instantiations and method calls from the client:

```ruby
class TrackInitializer
  attr_accessor :audio_files_list, :audio_files_hash

  def initialize
    db_connector = DBConnector.create
    db_connector.load_audio_files
    db_connector.validate_audio_files

    @audio_files_list = db_connector.audio_files_list
    audio_files_hash = db_connector.audio_files_hash

    audio_files_hash.each do |hash|
      hash['url'] = db_connector.audio_files_path + '/' + hash['filename'] + hash['file_format']
    end

    @audio_files_hash = audio_files_hash
  end
end
```

This implementation makes it so the client can simply create an initializer that will do all the work for them. Client code becomes very small:

```ruby
track_initializer = TrackInitializer.new
track_list = track_initializer.build_tracks
```

#### Adapter
I implemented adapters to handle audio files of different types on the frontend. Prior to this, the player could only work with `.mp3` files. Now it can also play `.wav` and `.flac`. To do this, I made a separate adapter for each file type:

```typescript
export interface AudioAdapter {
  getUrl(): string
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
```

The adapter interface will then choose the appropriate implementation, and the client doesn't need to worry about it:

```typescript
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
```

Each adapter has their own way of processing an audio file of their type, but the result they produce will work perfectly fine with the rest of the system, because they all follow the same interface.

#### Proxy
I implemented a protection proxy that allows to control access to track depending on user status. Instead of `Track` objects, the system works with `ProxyTrack`, which hides the real track's data from regular users, unless they have premium access:

```typescript
export class ProxyTrack implements Track {
  private real: Track;
  private user: User;

  constructor(real: Track, user: User) {
    this.real = real;
    this.user = user;
  }

  get url() {
    if (this.real.isPremium && !this.user.isPremium) {
      return "/audio_files/slow_dance.mp3";
    }
    return this.real.url;
  }
}
```

This makes it easy to control access to the tracks without affecting any of the system logic. The rest of the system makes no distinction between regular track and proxy track, and works with them in the same way.

### Conclusion
In this laboratory work I expanded my existing project by implementing structural design patterns. Using these patterns makes working with existing code much less messy. It also helps a lot when you need to expand the system or add new functionality, because these patterns are designed to be scalable and help with managing complex systems.