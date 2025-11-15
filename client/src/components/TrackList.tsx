import React, { useEffect, useState } from "react";
import type {Playlist} from "./PlaylistBar.tsx";

interface Props {
  playlist: Playlist;
  onTrackSelection: (track: Track) => void;
}

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
}

const TrackList: React.FC<Props> = ({ playlist, onTrackSelection}) => {
  const [tracks, setTracks] = useState<Track[]>([])
  const [activeTrack, setActiveTrack] = useState<Track | null>(null)

  useEffect(() => {
    fetch("http://localhost:4567/tracks")
      .then((res) => res.json())
      .then((data) => setTracks(data))
      .catch(console.error);
  }, [])

  useEffect(() => {
    if (activeTrack) {
      onTrackSelection(activeTrack);
    }
  }, [activeTrack]);

  const filteredTracks = tracks.filter((track) =>
    playlist.tracks.includes(track.filename)
  )

  return (
    <div className="p-4 space-y-4 text-neutral-100 bg-neutral-800">
      <h1 className="text-xl font-bold">{playlist.name} — Tracks</h1>
      {filteredTracks.length > 0 ? (
        filteredTracks.map((track) =>
          <div
            key={track.id}
            onClick={() => setActiveTrack(track)}
            className={`p-3 rounded-2xl shadow-sm bg-neutral-900 ${
              activeTrack && (activeTrack.id === track.id)
                ? 'bg-neutral-800 border-2 border-red-800'
                : 'hover:border-neutral-600 border-2 border-neutral-800'
            }`}
          >
            <div className="font-semibold">{track.title}</div>
            <div className="text-sm text-gray-400">{track.artist}</div>
            {/*<audio controls className="mt-2 w-full">*/}
            {/*  <source src={props.url} type="audio/mpeg" />*/}
            {/*  Your browser does not support the audio element.*/}
            {/*</audio>*/}
          </div>
        )
      ) : (
          <p className="text-neutral-400 italic">No tracks in this playlist.</p>
      )}
    </div>
  );
};

export default TrackList;
