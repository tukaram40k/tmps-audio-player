import React, { useState } from 'react'
import './App.css'
import PlaylistBar, { type Playlist } from "./components/PlaylistBar.tsx"
import AudioPlayer from "./components/AudioPlayer.tsx"
import TrackList from "./components/TrackList.tsx"
import type { Track } from './components/TrackItem.tsx'
import ActiveTrackBar from "./components/ActiveTrackBar.tsx"

const App: React.FC = () => {
  const [showAudioPlayer, setShowAudioPlayer] = useState<boolean>(false)
  const [activeTrack, setActiveTrack] = useState<Track | null>(null)
  const [activePlaylist, setActivePlaylist] = useState<Playlist | null>(null)

  const handlePlaylistSelection = (playlist: Playlist) => {
    setActivePlaylist(playlist)
  }

  return (
    <div className="app-container">
    {/* playlist sidebar left */}
    <PlaylistBar onPlaylistSelection={handlePlaylistSelection} />

    {/* active track list */}
    {activePlaylist && <TrackList playlist={activePlaylist}/>}

    {/* playlist sidebar left */}
    <ActiveTrackBar />

    {/* player controls */}
    { showAudioPlayer && <AudioPlayer /> }

    </div>
  )
}

export default App