import React from 'react'
import type {Track} from "./TrackList.tsx";

interface Props {
  track: Track;
}

const AudioPlayer: React.FC<Props> = ({ track }) => {
  return (
    <div className="bg-amber-300">player</div>
  )
}

export default AudioPlayer