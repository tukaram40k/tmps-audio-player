## Creational Design Patterns

***

### Course: TMPS

### Author: Rudenco Ivan

***

### Objectives:

* Get familiar with the Creational DPs;
* Choose a specific domain;
* Implement at least 3 CDPs for the specific domain;

### Used Design Patterns:

* Singleton - a creational design pattern that lets you ensure that a class has only one instance, while providing a global access point to this instance.
* Factory Method - a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.
* Builder - a creational design pattern that lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code.

### Implementation

I chose a music streaming platform as the domain for this project. Its main features are track creation from local music files, and flexible playlist creation.

#### Singleton
I made class `DBConnector` as a singleton:

```ruby
class DBConnector
  @instance = nil

  private_class_method :new

  def self.create
    @instance ||= new
  end
end
```

* this implementation makes constructor private, so the class can only be instantiated using the `create` method.
* this is useful because now we can be sure that only one db connection is present at any moment

#### Factory Method
I implemented a factory method to handle `Track` object creation.

```ruby
class TrackCreator
  # factory method
  def create_track(hash)
    raise NotImplementedError
  end
end
```
This class serves as an interface for concrete creators which will override the `create_track` factory method with their own implementations:

```ruby
class StandardTrackCreator < TrackCreator
  def create_track(hash)
    @track = StandardTrack.new
    @track.set_core_data(
      hash['id'],
      hash['title'],
      hash['duration'],
      hash['file_format'],
      hash['filename'],
      hash['url']
    )
  end
end
```
This pattern is useful because we don't need to specify the exact class that needs to be created, and can use same logic to make different products.

#### Builder
I implemented the builder pattern to do `Playlist` object creation.

Class `Playlist` has a lot of attributes and takes several steps to instantiate:
```ruby
class Playlist
  attr_accessor :id, :name, :creator, :description,
                :privacy_settings, :creation_date,
                :allowed_order, :dynamic, :type, :persistent,
                :tracks
end
```

Creation of `Playlist` is done in several concrete builders:
```ruby
class ArtistPlaylistConcreteBuilder < PlaylistBuilder
  def reset
    @artist_playlist = Playlist.new
  end

  def playlist
    artist_playlist = @artist_playlist
    reset
    artist_playlist
  end
end
```
The concrete builders implement several methods that break down playlist creation into smaller steps:
```ruby
def set_metadata(name, creator, description)
  @artist_playlist.set_name(name)
  @artist_playlist.set_creator(creator)
  @artist_playlist.set_description(description)
  @artist_playlist.set_creation_date
end

def set_system_settings(privacy_settings)
  @artist_playlist.set_privacy_settings(privacy_settings)
  @artist_playlist.set_type('artist-album')
end
```

The `PlaylistDirector` class is used to abstract creation steps so that client code can just call `build_playlist` and get the result:
```ruby
class PlaylistDirector
  def initialize(builder)
    @playlist_builder = builder
  end

  def build_playlist(hash)
    @playlist_builder.reset
    @playlist_builder.set_id(hash['id'])
    @playlist_builder.set_metadata(hash['name'], hash['creator'], hash['description'])
    @playlist_builder.set_system_settings(hash['privacy_settings'])
    @playlist_builder.set_tracks(hash['tracks'])
    @playlist_builder.playlist
  end
end
```

### Results
In order to better visualize the project, I implemented a web user interface using TypeScript with React. It is a single-page application that provides ui to select a playlist, select a track from it and play the track. It also shows additional information about the track in the sidebar.

![img.png](img/img.png)

### Conclusion
In this laboratory work I implemented creational design patterns in a project. Using these patterns makes the process of creating new objects much less messy. It also helps a lot when you need to expand the system or add new functionality, because these patterns are designed to be scalable and help with managing complex systems.