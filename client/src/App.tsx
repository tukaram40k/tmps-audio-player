import React, { useState } from 'react'
import './App.css'
import SideBar from "./components/SideBar.tsx";
import AudioPlayer from "./components/AudioPlayer.tsx";
import TrackList from "./components/TrackList.tsx";

const App: React.FC = () => {
  const [showSidebar, setShowSidebar] = useState<boolean>(true)
  const [showAudioPlayer, setShowAudioPlayer] = useState<boolean>(true)

  return (
    <div className="app-container">
    {/* playlist sidebar left */}
    { showSidebar && <SideBar /> }

    {/* active track list */}
    <TrackList />

    {/* player controls */}
    { showAudioPlayer && <AudioPlayer /> }

    {/* optional settings/info sidebar right */}
    </div>
  )
}

export default App