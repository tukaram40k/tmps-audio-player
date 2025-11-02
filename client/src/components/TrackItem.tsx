import React from 'react'

export interface Track {
  id: number;
  filename: string;
  title: string;
  artist: string;
  url: string;
}

const TrackItem: React.FC<Track> = (props) => {
  return (
    <div className="p-3 rounded-2xl shadow-sm bg-neutral-900">
      <div className="font-semibold">{props.title}</div>
      <div className="text-sm text-gray-600">{props.artist}</div>
      <audio controls className="mt-2 w-full">
        <source src={props.url} type="audio/mpeg" />
        Your browser does not support the audio element.
      </audio>
    </div>
  )
}

export default TrackItem