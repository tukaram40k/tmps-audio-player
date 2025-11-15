import React, { useState } from 'react'
import './App.css'
import PlaylistBar, { type Playlist } from "./components/PlaylistBar.tsx"
import AudioPlayer from "./components/audio_player/AudioPlayer.tsx"
import TrackList, { type Track } from "./components/TrackList.tsx"
import ActiveTrackBar from "./components/ActiveTrackBar.tsx"

const App: React.FC = () => {
  const [activeTrack, setActiveTrack] = useState<Track | null>(null)
  const [activePlaylist, setActivePlaylist] = useState<Playlist | null>(null)

  const handlePlaylistSelection = (playlist: Playlist) => {
    setActivePlaylist(playlist)
  }

  const handleTrackSelection = (track: Track) => {
    setActiveTrack(track)
  }

  return (
    <div className="app-container">
    {/* playlist sidebar left */}
    <PlaylistBar onPlaylistSelection={handlePlaylistSelection} />

    {/* active track list */}
    {activePlaylist &&
        <TrackList playlist={activePlaylist} onTrackSelection={handleTrackSelection} />
    }

    {/* active track bar */}
    <ActiveTrackBar track={activeTrack} />

    {/* player controls */}
    {activeTrack && <div className="flex items-center justify-center bg-neutral-800">
      <AudioPlayer track={activeTrack} />
    </div>}

    </div>
  )
}

export default App